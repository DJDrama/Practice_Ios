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
    var lawItems = [String: LawItem]()
    
    
    let context = PersistentController.shared.persistentContainer.viewContext
    
    
    init() {
        fetchItems()
    }
    
    func fetchItems(){
        lawItems = lawData
        readData()
    }
    
    func searchQuery(query queryStr: String){
        var searchedMap = [String : LawItem]()
        for (key, value) in lawItems {
            if key.contains(queryStr) {
                searchedMap[key] = value
            }
            for content in value.content {
                if content.contains(queryStr) {
                    searchedMap[key] = value
                }
            }
        }
        lawItems = searchedMap
    }
    
    
    
    // CRUD
    func readData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Memo")
        do{
            let results = try context.fetch(request) as! [NSManagedObject]
            for res in results {
                let obj = res
                let resTitle = obj.value(forKey: "title") as! String
                let resIndex = obj.value(forKey: "memoIndex") as! Int
                let resMemo = obj.value(forKey: "memo") as! String
                
                self.lawItems[resTitle]?.memo[resIndex] = resMemo
            }
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
            self.lawItems[title]?.memo[index] = query
            //self.data.append(entity)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func updateData(title: String, query: String, index: Int){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Memo")
        do{
            let results = try context.fetch(request) as! [NSManagedObject]
            for res in results {
                let obj = res
                let resTitle = obj.value(forKey: "title") as! String
                let resIndex = obj.value(forKey: "memoIndex") as! Int
                if resTitle == title && resIndex == index {
                    obj.setValue(query, forKey: "memo")
                    
                    try context.save()
                    self.lawItems[title]?.memo[index] = query
                    break
                }
            }
            
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func deleteData(title: String, index: Int){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Memo")
        do{
            let results = try context.fetch(request) as! [NSManagedObject]
            for res in results {
                let obj = res
                let resTitle = obj.value(forKey: "title") as! String
                let resIndex = obj.value(forKey: "memoIndex") as! Int
                if resTitle == title && resIndex == index {
                    context.delete(obj)
                    
                    try context.save()
                    break
                }
            }
            
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
}
