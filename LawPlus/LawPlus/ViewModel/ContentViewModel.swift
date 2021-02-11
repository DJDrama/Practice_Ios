//
//  ContentViewModel.swift
//  LawPlus
//
//  Created by jb on 2021/02/11.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var lawItems = [LawItem]()
    
    init() {
        fetchItems()
    }
    
    func fetchItems(){
        lawItems = lawData
    }
    
    func searchQuery(query queryStr: String){
        var searchedSet = Set<LawItem>()
        for item in lawItems {
            if(item.title.contains(queryStr)){
                searchedSet.insert(item)
            }
            for content in item.content {
                if(content.contains(queryStr)){
                    searchedSet.insert(item)
                }
            }
        }
        
        lawItems = Array(searchedSet)
    }
}
