//
//  CustomTextField.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/08.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeHolder: Text
    let imageName: String
    
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty{
                placeHolder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.87)))
                    .padding(.leading, 40)
            }
            HStack(spacing: 16){
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        }
    }
}
