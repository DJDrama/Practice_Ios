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
    
    
    let context = PersistentController.shared.persistentContainer.viewContext
    
    
    init() {
        fetchItems()
    }
    
    func fetchItems(){
        lawItems = lawData
        readData()
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

    
    
    // CRUD
    func readData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Memo")
        do{
            let results = try context.fetch(request)
         //   self.data = results as! [NSManagedObject]
            print("FUCK \(results.count)")
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func saveData(title: String, query: String, index: Int){
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Memo", into: context)
        entity.setValue(title, forKey: "title")
        entity.setValue(query, forKey: "memo")
        entity.setValue(index, forKey: "memoIndex")
        
        do{
            try context.save()
            //self.data.append(entity)
        }catch{
            print(error.localizedDescription)
        }
    }
 
}
