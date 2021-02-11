//
//  ContentView.swift
//  LawPlus
//
//  Created by jb on 2021/02/11.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var lawTerm: String = "법령조회"
    @State private var searchQuery: String = ""
    
    var body: some View {
        ScrollView{
            VStack{
                ZStack(alignment:.trailing){
                    HStack{
                        Image("logo")
                            .resizable()
                            .frame(width: 58, height: 24)
                            .padding(.vertical, 8)
                    }.frame(maxWidth: .infinity)
                    Image("profile")
                        .resizable()
                        .frame(width: 28, height: 28)
                        .padding(.trailing, 20)
                }
                
                HStack{
                    Menu(lawTerm){
                        Button(action: {
                            lawTerm = "1조"
                        }, label: {
                            Text("1조")
                                .underline()
                        })
                    }
                    .frame(width: 62)
                    .foregroundColor(Color.init(hex: COLOR_PINKISH_GRAY))
                    Image("down")
                    
                    Spacer().frame(width: 25)
                    
                    TextField("검색어를 입력하세요.", text: $searchQuery)
                        .onChange(of: searchQuery){query in
                            if query.isEmpty {
                                    viewModel.fetchItems()
                            }
                        }
                    
                    Button(action: {
                        viewModel.searchQuery(query: searchQuery)
                    }, label: {
                        Image("search")
                            .resizable()
                            .frame(width: 20, height: 20)
                    })
                  
                }.padding(.horizontal, 20)
                .padding(.top, 16)
                
                HStack{
                    Rectangle().fill(Color.init(hex: COLOR_PINKISH_GRAY)).frame(width: 85, height: 1)
                    Spacer().frame(width: 25)
                    Rectangle().fill(Color.init(hex: COLOR_PINKISH_GRAY)).frame(height: 1)
                }.padding(.horizontal, 20)
                
            }
            .padding(.vertical, 4)
            
            LazyVStack{
                ForEach(viewModel.lawItems, id: \.self){item in
                    LawCardView(lawItem: item)
                    Rectangle().fill(Color.init(hex: COLOR_PINKISH_GRAY)).frame(height: 4)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
