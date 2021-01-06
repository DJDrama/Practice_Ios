//
//  MessageInputView.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/06.
//

import SwiftUI

struct MessageInputView: View {
    @Binding
    var messageText: String
    var body: some View {
        HStack{
            TextField("Messsage...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: {}, label: {
                Text("Send")
            })
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(messageText: .constant("Message..."))
    }
}
