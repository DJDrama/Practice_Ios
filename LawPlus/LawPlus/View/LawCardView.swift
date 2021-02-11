//
//  LawCardView.swift
//  LawPlus
//
//  Created by jb on 2021/02/11.
//

import SwiftUI

struct LawCardView: View {
    @State private var isStarPressed = false
    @State private var memoCount=0
    let viewModel: ContentViewModel
    let lawItem: LawItem
    
    var body: some View {
        VStack{
            HStack(alignment: .top){
                Button(action: {
                    isStarPressed.toggle()
                }, label: {
                    isStarPressed ? Image("star_pressed") : Image("star")
                })
                .padding(.leading, 14)
                .padding(.trailing, 12)
                
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Text(lawItem.title)
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.init(hex: COLOR_WARM_BLUE))
                        Spacer()
                        Button(action: {
                            memoCount += 1
                        }, label: {
                            Text("메모")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .padding(.horizontal, 5)
                                .padding(.vertical, 3)
                                .background(Color.init(hex: COLOR_WARM_BLUE))
                        })
                        .padding(.trailing, 20)
                    }
                    
                    LazyVStack(alignment: .leading){
                        ForEach(lawItem.content, id: \.self){str in
                            Text(str)
                                .foregroundColor(Color.init(hex: COLOR_GRAYISH_BROWN))
                                .font(.system(size: 14))
                                .padding(.bottom, 10)
                        }
                    }
                    .padding(.trailing, 64)
                    
                    LazyVStack{
                        ForEach(0 ..< memoCount, id: \.self) { index in
                            MemoView(memoCount: index)
                                .padding(.bottom, 8)
                                .padding(.trailing, 20)
                        }
                    }
                }
            }
        }
        .padding(.vertical, 30)
        
    }
}

struct LawCardView_Previews: PreviewProvider {
    static var previews: some View {
        LawCardView(viewModel: ContentViewModel(), lawItem: LawItem(lawType: CI, article: "1조", title: "제1조(법원)", content: ["민사에 관하여 법률에 규정이 없으면 관습법에 의하고 관습법이 없으면 조리에 의한다."]))
    }
}
