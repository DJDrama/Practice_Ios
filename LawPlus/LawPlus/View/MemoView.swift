//
//  MemoView.swift
//  LawPlus
//
//  Created by jb on 2021/02/11.
//

import SwiftUI

struct MemoView: View {
    @EnvironmentObject var viewModel: ContentViewModel
    @State private var text: String
    
    let lawTitle: String
    let memoCount: Int
    let originalString: String
    
    init(lawTitle: String, memoCount: Int, memoString: String){
        self.lawTitle = lawTitle
        self.memoCount = memoCount
        _text = State(initialValue: memoString)
        
        self.originalString = memoString
    }
    
    var body: some View {
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
                            if !originalString.isEmpty{
                                if text.isEmpty{
                                    // delete
                                    viewModel.deleteData(title: lawTitle, index: memoCount)
                                }else{
                                    viewModel.updateData(title: lawTitle, query: text, index: memoCount)
                                }
                            }else{
                                if text.isEmpty {
                                    return
                                }
                                viewModel.saveData(title: lawTitle, query: text, index: memoCount)
                            }
                            
                        }, label: {
                            if !originalString.isEmpty{
                                Text("수정")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.init(hex: COLOR_PALERED))
                            }else{
                                Text("확인")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.init(hex: COLOR_WARM_BLUE))
                            }
                            
                        })
                    }
                    Rectangle().fill(Color.init(hex: COLOR_PINKISH_GRAY)).frame(height: 1)
                        .padding(.top, -2)
                }
                
            }
        }
    }
}
