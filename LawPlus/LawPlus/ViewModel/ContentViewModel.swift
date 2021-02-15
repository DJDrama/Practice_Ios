//
//  ContentViewModel.swift
//  LawPlus
//
//  Created by jb on 2021/02/11.
//

import SwiftUI
import CoreData


class ContentViewModel: ObservableObject {
    @Published
    var lawItems = [LawItem]()
    @Environment(\.managedObjectContext)
    private var moc
    @FetchRequest(entity: Memo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Memo.id, ascending: true)])
    private var memos: FetchedResults<Memo>
    
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
    
    func saveMemo(title: String, query: String, index: Int){
        let memo = Memo(context: self.moc)
        memo.title = title
        memo.memo = query
        memo.memoIndex = NSDecimalNumber(value: index)
        do{
            try self.moc.save()
        }catch{
            print("ERROR \(error.localizedDescription)")
        }
    }
    
 
}
