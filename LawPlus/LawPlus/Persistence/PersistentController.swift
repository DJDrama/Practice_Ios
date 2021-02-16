//
//  PersistentController.swift
//  LawPlus
//
//  Created by jb on 2021/02/16.
//

import Foundation
import CoreData

struct PersistentController {
    static let shared = PersistentController()
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LawPlus")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext(){
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do{
                try context.save()
            }catch{
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    
    
}
