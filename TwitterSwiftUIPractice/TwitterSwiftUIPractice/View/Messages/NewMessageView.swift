//
//  NewMessageView.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/06.
//

import SwiftUI

struct NewMessageView: View {
    @State
    var searchText: String = ""
    
    @Binding
    var show: Bool
    @Binding
    var startChat: Bool
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            
            VStack(alignment: .leading){
                ForEach(viewModel.users){ user in
                    HStack{
                        Spacer()
                    }
                    Button(action: {
                        self.show.toggle()
                        self.startChat.toggle()
                    }, label: {
                        UserCell(user: user)
                    })
                    
                }
            }.padding(.leading)
        }
        
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(show: .constant(true), startChat: .constant(true))
    }
}
