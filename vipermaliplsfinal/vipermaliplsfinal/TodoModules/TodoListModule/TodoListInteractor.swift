//
//  TodoListInteractor.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 24.09.2021.
//

import UIKit
import CoreData

class TodoListInteractor {
    var presenter: TodoListPresenterProtocol?
    private var coreDataManager = CoreDataManager.shared
    private var items: [TodoEntity] = []
    
}
extension TodoListInteractor: TodoListInteractorProtocol{
    func retrieveItem(at index: Int) {
        let items = coreDataManager.loadItems()
        self.presenter?.getItemSuccess(item: items[index])
        // get Items from CoreData and do presenter's getItemSuccess func
    }
    
    func loadTodos() {
        // get items in coredata and if there is a data go to presenter and do fetchItemSuccess func
        items = coreDataManager.loadItems()
        if items.count > 0 {
            presenter?.fetchItemSuccess(items: items)
        }
    }
    
    func addTodo(todoTitle: String, completion: (Result<[TodoEntity], Error>) -> Void) {
        let todo = coreDataManager.addItem(title: todoTitle)
        items.append(todo)
        presenter?.fetchItemSuccess(items: items)
        // append todo to todo array and do presenter's fetchItemSuccess func
    }
    
    func deleteTodo(indexPath: IndexPath, completion: (Result<[TodoEntity], Error>) -> Void) {
        let todo = items[indexPath.row]
        coreDataManager.deleteItem(item: todo)
        items.remove(at: indexPath.row)
        presenter?.fetchItemSuccess(items: items)
    }
    //Delete todo from coreData and todo array
    //do presenter's fetchItemSucces func(reload TAbleView)
}

