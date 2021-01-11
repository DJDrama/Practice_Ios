//
//  AuthViewModel.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/11.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject{
    
    func login(){
        
    }
    
    func register(email: String, password: String, username: String, fullname: String, profileImage: UIImage){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error{
                print("DEBUG: Error \(error.localizedDescription)")
                return
            }
            print("DEBUG: Successfully singed up user...")
            
        }
        
    }
    
}
