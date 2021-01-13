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
    
    @State var showChat = false
    @State private var inSearchMode = false
    
    @ObservedObject var viewModel = ConversationsViewModel()
    
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
//            NavigationLink(
//                destination: ChatView(user: ),
//                isActive: $showChat,
//                label: {
//
//                })
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.recentMessages) { message in
                        NavigationLink(
                            destination: ChatView(user: message.user),
                            label: {
                                ConversationCell(message: message)
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
            .sheet(isPresented: $isShowingNewMessageView , content: {
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
