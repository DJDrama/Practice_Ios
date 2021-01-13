//
//  ConversationCell.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/06.
//

import SwiftUI
import Kingfisher

struct ConversationCell: View {
    let message :Message
    
    var body: some View {
        VStack {
            HStack(spacing: 12){
                KFImage(URL(string: message.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56/2)
                
                VStack(alignment: .leading, spacing: 4){
                    Text(message.user.fullname)
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text(message.text)
                        .font(.system(size: 14))
                        .lineLimit(2)
                }
                .foregroundColor(.black)
                .padding(.trailing)
            }
            Divider()
        }
    }
}

