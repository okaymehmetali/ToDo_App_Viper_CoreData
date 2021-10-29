//
//  CoreDataManager.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 24.09.2021.
//

import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "vipermaliplsfinal")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
            }
        })
        return container
    }()
    
    private lazy var viewContext: NSManagedObjectContext = persistentContainer.viewContext
    
    
    
    func addItem(title: String) -> TodoEntity {
        let context = persistentContainer.viewContext
        
        let item = TodoEntity(entity: TodoEntity.entity(), insertInto: viewContext)
        item.todoItem = title
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Add Item Error")
            }
        }
        
        return item
    }
    
    func loadItems() -> [TodoEntity]{
        let fetchRequest = NSFetchRequest<TodoEntity>(entityName: "TodoEntity")
        fetchRequest.returnsObjectsAsFaults = false
        var items: [TodoEntity] = []
        
        do {
            items = try viewContext.fetch(fetchRequest)
            return items
        } catch {
            print("Load items error")
        }
        
        return items
    }
    func deleteItem(item: TodoEntity) {
        let context = persistentContainer.viewContext
        context.delete(item)
        
        do {
            try context.save()
        } catch {
            print("delete error")
        }
    }
    func editItem(title: String, item: TodoEntity) {
        let context = persistentContainer.viewContext
        item.setValue(title, forKey: "todoItem")
        
        do {
            try context.save()
        } catch {
            print("edit error")
        }
    }
}
