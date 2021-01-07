//
//  ProfileHeader.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/07.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack{
            Image("batman")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .shadow(color: .black, radius: 6, x:0.0, y:0.0)
            
            Text("Bruce Wayne")
                .font(.system(size:16, weight: .semibold))
                .padding(.top, 8)
            
            Text("@batman")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Billionaire by day, dark knight by night")
                .font(.system(size:14))
                .padding(.top, 8)
            
            HStack(spacing: 40){
                VStack{
                    Text("12")
                        .font(.system(size: 16))
                        .bold()
                    
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                VStack{
                    Text("12")
                        .font(.system(size: 16))
                        .bold()
                    
                    Text("Following")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            
            Spacer()
        }
        
    }
}

struct ProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
