//
//  LawItem.swift
//  LawPlus
//
//  Created by jb on 2021/02/11.
//

import Foundation

struct LawItem: Hashable{
    
    let lawType: String
    let article: String
    let title: String
    let content: [String]
    let memo: [String]? = nil
}
