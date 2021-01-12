//
//  AuthViewModel.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/11.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    static let shared = AuthViewModel()
    
    init(){
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Failed to login \(error.localizedDescription)")
                return
            }
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    func register(email: String, password: String, username: String, fullname: String, profileImage: UIImage){
        
        /** Image Upload **/
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3)
        else { return }
        
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(fileName)
        
        storageRef.putData(imageData, metadata: nil){_, error in
            if let error = error {
                print("DEBUG: Failed to upload image \(error.localizedDescription)")
                return
            }
            storageRef.downloadURL{url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                /** Firebase Sign Up **/
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error{
                        print("DEBUG: Error \(error.localizedDescription)")
                        return
                    }
                    guard let user = result?.user else { return }
                    let data = ["email": email,
                                "username": username.lowercased(),
                                "fullname": fullname,
                                "profileimageUrl": profileImageUrl,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data){ _ in
                        //print("DEBUG: Succesfully uploaded user data...")
                        // login
                        self.userSession = result?.user
                        self.fetchUser()
                    }
                }
            }
        }
        
    }
    
    func signOut(){
        userSession = nil
        user = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        guard let uid = userSession?.uid else { return }
        
        Firestore.firestore().collection("users").document(uid).getDocument { (snapshot, error) in
            guard let data = snapshot?.data() else{ return }
            self.user = User(dictionary: data)
            
        }
    }
}
