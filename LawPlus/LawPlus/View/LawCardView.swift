//
//  LawCardView.swift
//  LawPlus
//
//  Created by jb on 2021/02/11.
//

import SwiftUI

struct LawCardView: View {
    @State private var isStarPressed = false
    
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
                        Text("제 1조(법원)")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color.init(hex: COLOR_WARM_BLUE))
                        Spacer()
                        Button(action: {
                            
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
                    
                    Text("민사에 관하여 법률에 규정이 없으면 관습법에 의하고 관습법이 없으면 조리에 의한다.")
                        .padding(.trailing, 64)
                        .foregroundColor(Color.init(hex: COLOR_GRAYISH_BROWN))
                        .font(.system(size: 14))
                }
            }
        }
        .padding(.vertical, 30)
    }
}

struct LawCardView_Previews: PreviewProvider {
    static var previews: some View {
        LawCardView()
    }
}
