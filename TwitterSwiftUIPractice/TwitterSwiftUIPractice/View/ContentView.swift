//
//  ContentView.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/06.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        Group{
            if viewModel.userSession != nil {
                NavigationView{
                    TabView{
                        FeedView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                        SearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        ConversationsView()
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Message")
                            }
                    }
                    .navigationBarTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
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
