//
//  MainView.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/19.
//

import SwiftUI
import Kingfisher

struct MainView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        TabView{
            NavigationView{
                FeedView()
                    //.navigationBarHidden(true)
                    
                    .navigationBarTitle("Home")
                    .navigationBarItems(leading: Button(action: {
                        viewModel.signOut()
                    }, label: {
                        if let user = viewModel.user {
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .frame(width: 32, height: 32)
                                .cornerRadius(16)
                        }
                    }))
                    .navigationBarTitleDisplayMode(.inline)
                    
                //.edgesIgnoringSafeArea([.top, .bottom])
            }.tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            NavigationView{
                SearchView()
                    .navigationBarHidden(true)
            }.tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            NavigationView{
                ConversationsView()
                    .navigationBarTitle("Messages")
                    .navigationBarTitleDisplayMode(.inline)
            }.tabItem {
                Image(systemName: "envelope")
                Text("Message")
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
