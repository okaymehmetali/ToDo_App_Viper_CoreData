//
//  TodoEntity.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 24.09.2021.
//

import CoreData

@objc(TodoEntity)
class TodoEntity : NSManagedObject {
    @NSManaged var todoItem: String!
}
//identify entity
