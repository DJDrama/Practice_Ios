//
//  SearchView.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/06.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading){
                ForEach(searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)){ user in
                    HStack{Spacer()}
                    
                    NavigationLink(
                        destination: LazyView(UserProfileView(user: user)),
                        label: {
                            UserCell(user: user)
                        })
                }
            }.padding(.leading)
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
