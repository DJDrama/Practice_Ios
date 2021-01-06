//
//  UserCell.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/06.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12){
            Image("venom-10")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(56/2)
            
            VStack(alignment: .leading, spacing: 4){
                Text("venom")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Unknown")
                    .font(.system(size: 14))
            }
            .foregroundColor(.black)
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
