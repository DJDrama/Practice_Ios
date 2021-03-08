//
//  ContentView.swift
//  CustomBottomNavigation
//
//  Created by jb on 2021/03/08.
//

import SwiftUI

struct ContentView: View {
    @State var index = 0
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                if self.index == 0 {
                    Color.red.edgesIgnoringSafeArea(.top)
                }else if self.index==1{
                    Color.blue.edgesIgnoringSafeArea(.top)
                }else if self.index==2{
                    Color.black.edgesIgnoringSafeArea(.top)
                }else if self.index==3{
                    Color.white.edgesIgnoringSafeArea(.top)
                }else{
                    Color.gray.edgesIgnoringSafeArea(.top)
                }
            
            }
            .padding(.bottom, -35)
            CustomTabs(index: self.$index)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabs : View {
    @Binding var index: Int
    var body: some View{
        HStack{
            Button(action: {
                self.index = 0
            }){
                Image("menu_account_on")
            }.foregroundColor(Color.black.opacity(self.index == 0 ? 1: 0.1))
            
            Spacer(minLength: 0)
            Button(action: {
                self.index = 1
            }){
                Image("menu_berrypic_on")
            }.foregroundColor(Color.black.opacity(self.index == 1 ? 1: 0.1))
            .offset(x:10)
            
            Spacer(minLength: 0)
            
            Button(action: {
                
            }, label: {
                Image("map").renderingMode(.original)
                    .padding(8)
                    .background(Color.blue)
                    .clipShape(Circle())
            })
            .offset(y: -25)
            
            Spacer(minLength: 0)
            Button(action: {
                self.index = 2
            }){
                Image("menu_feed_on")
            }.foregroundColor(Color.black.opacity(self.index == 2 ? 1: 0.1))
            .offset(x:-10)
            
            Spacer(minLength: 0)
            Button(action: {
                self.index = 3
            }){
                Image("menu_profile_on")
            }.foregroundColor(Color.black.opacity(self.index == 3 ? 1: 0.1))
        }
        .padding(.horizontal, 35)
        .padding(.top, 35)
        .background(Color.white)
        .clipShape(CShape())
    }
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{ path in
            path.move(to: CGPoint(x: 0, y: 35))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 35))
            path.addArc(center: CGPoint(x: (rect.width/2), y: 35), radius: 35, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            
        }
    }
}
