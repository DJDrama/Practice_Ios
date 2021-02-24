//
//  ContentView.swift
//  SwiftUIPullToRefresh
//
//  Created by jb on 2021/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    
    @State var arrayData = ["Hello1", "Hello2", "Hello3", "Hello4", "Hello5"]
    @State var refresh = Refresh(started: false, released: false)
    
    var body: some View {
        VStack(spacing: 0){
            HStack{
                Text("Pull To Refresh")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.purple)
                Spacer()
            }
            .padding()
            .background(Color.white.ignoresSafeArea(.all, edges: .top))
            
            Divider()
            
            ScrollView(.vertical, showsIndicators: false, content: {
                // geometry reader for calculating position
                GeometryReader{ reader -> AnyView in
                    DispatchQueue.main.async {
                        if refresh.startOffset==0 {
                            refresh.startOffset = reader.frame(in: .global).minY
                        }
                        
                        refresh.offset = reader.frame(in: .global).minY
                        
                        if refresh.offset - refresh.startOffset > 80 && !refresh.started {
                            refresh.started = true
                        }
                        
                        // checking if refresh uis started and drag is released
                        if refresh.startOffset == refresh.offset && refresh.started && !refresh.released {
                            withAnimation(Animation.linear){
                                refresh.released = true
                                updateData()
                            }
                        }
                        
                    }
                    return AnyView(Color.black.frame(width: 0, height: 0))
                }
                .frame(width: 0, height: 0)
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                    // Arrow and indicator
                    if refresh.started && refresh.released {
                        ProgressView()
                            .offset(y: -35)
                    }else {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 16, weight: .heavy))
                            .foregroundColor(.gray)
                            .rotationEffect(.init(degrees: refresh.started ? 180:0))
                            .offset(y: -25)
                            .animation(.easeIn)
                    }
                    
                    VStack{
                        ForEach(arrayData, id:\.self){value in
                            HStack{
                                Text(value)
                                Spacer()
                                Image(systemName:"chevron.right")
                                    .foregroundColor(.black)
                            }
                            .padding()
                        }
                    }
                    .background(Color.white)
                }
                .offset(y: refresh.released ? 40 : -10)
            })
        }
        .background(Color.black.opacity(0.06).ignoresSafeArea())
    }
    
    func updateData(){
        print("update Data...")
        // Delaying For smooth animation....
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation(Animation.linear){
                arrayData.append("Updated Data")
                refresh.released = false
                refresh.started = false
            }
        }
    }
}

// Refresh Model
struct Refresh {
    var startOffset: CGFloat = 0
    var offset: CGFloat = 0
    var started: Bool
    var released: Bool
}
