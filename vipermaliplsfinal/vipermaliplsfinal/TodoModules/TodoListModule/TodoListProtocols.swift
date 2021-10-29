//
//  TodoListProtocols.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 24.09.2021.
//

import UIKit

protocol TodoListViewProtocol: AnyObject {
    
    var presenter: TodoListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showTodos(items: [TodoEntity])
    func handleItems(with results: [TodoEntity])
}

protocol TodoListPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    
    func viewDidLoad()
    func addTodo(todoTitle: String)
    func deleteItem(indexPath: IndexPath)
    func textLabelText(indexPath: IndexPath) -> String?
    func numberOfRowsInSection() -> Int
    func fetchItemSuccess(items: [TodoEntity])
    func didSelectRowAt(index: Int)
    func getItemSuccess(item: TodoEntity)
}

protocol TodoListInteractorProtocol: AnyObject {
    
    var presenter: TodoListPresenterProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func loadTodos()
    func addTodo(todoTitle: String, completion: (Result<[TodoEntity], Error>) -> Void)
    func deleteTodo(indexPath: IndexPath, completion: (Result<[TodoEntity], Error>) -> Void)
    func retrieveItem(at index: Int)
    
}

protocol TodoListRouterProtocol: AnyObject {
    
    static func createTodoListModule() -> TodoListViewController
    
    // PRESENTER -> ROUTER
    func presentToDoDetailScreen(on view: TodoListViewProtocol, with item: TodoEntity)
}
