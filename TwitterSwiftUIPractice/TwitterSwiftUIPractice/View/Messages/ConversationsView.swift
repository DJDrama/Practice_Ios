//
//  ConversationsView.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/06.
//

import SwiftUI

struct ConversationsView: View {
    @State // reactive
    var isShowingNewMessageView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                LazyVStack{
                    ForEach(0..<20) { _ in
                        NavigationLink(
                            destination: ChatView(),
                            label: {
                                ConversationCell()
                            })
                    }
                }.padding()
            }
            
            Button(action:{ self.isShowingNewMessageView.toggle()}, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .padding()
            .sheet(isPresented: $isShowingNewMessageView
                   , content: {
                SearchView()
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
