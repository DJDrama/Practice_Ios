//
//  MemoView.swift
//  LawPlus
//
//  Created by jb on 2021/02/11.
//

import SwiftUI

struct MemoView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    @State private var text = ""
    let lawItem: LawItem
    let memoCount: Int
    
    var body: some View {
        if  memoCount < 3 {
            VStack(alignment: .trailing){
                HStack{
                    if memoCount == 0 {
                        Text("法")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .padding(8)
                            .frame(width: 28, height: 28)
                            .background(Color.init(hex: COLOR_WARM_BLUE))
                        
                    }else if memoCount == 1 {
                        Text("判")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .padding(8)
                            .frame(width: 28, height: 28)
                            .background(Color.init(hex: COLOR_WARM_BLUE))
                        
                    }else if memoCount==2{
                        Text("+")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .padding(8)
                            .frame(width: 28, height: 28)
                            .background(Color.init(hex: COLOR_WARM_BLUE))
                        
                    }
                    
                    VStack{
                        HStack{
                            TextField("입력하세요.", text: $text)
                                .font(.system(size: 14))
                            
                            Button(action: {
                                if text.isEmpty {
                                    return
                                }
                                viewModel.saveData(title: lawItem.title, query: text, index: memoCount)
                                
                            }, label: {
                                Text("확인")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.init(hex: COLOR_WARM_BLUE))
                            })
                        }
                        Rectangle().fill(Color.init(hex: COLOR_PINKISH_GRAY)).frame(height: 1)
                            .padding(.top, -2)
                    }
                    
                }
                
            }
        }
    }
}
