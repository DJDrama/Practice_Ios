//
//  ChatView.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/06.
//

import SwiftUI

struct ChatView: View {
    @State var messageText: String = ""
    let user: User
    let viewModel: ChatViewModel
    
    init(user: User){
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 12){
                    ForEach(MOCK_MESSAGES){message in
                        MessageView(message: message)
                    }
                }
            }.padding(.top)
            MessageInputView(messageText: $messageText, action: sendMessage)
                .padding()
                
        }
        .navigationTitle(user.username)
    }
    func sendMessage(){
        viewModel.sendMessage(messageText)
    }
}
