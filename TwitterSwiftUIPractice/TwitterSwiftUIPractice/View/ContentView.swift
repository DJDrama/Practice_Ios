//
//  ContentView.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/06.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
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
                            .navigationBarHidden(true)
                    }.tabItem {
                        Image(systemName: "envelope")
                        Text("Message")
                    }
                }
                
                
            }else{
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
