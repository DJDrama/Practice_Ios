//
//  Memo+CoreDataProperties.swift
//  LawPlus
//
//  Created by jb on 2021/02/15.
//
//

import Foundation
import CoreData


extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var title: String?
    @NSManaged public var memo: String?

}

extension Memo : Identifiable {

}
