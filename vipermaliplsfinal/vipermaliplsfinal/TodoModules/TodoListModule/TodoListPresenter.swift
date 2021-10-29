//
//  TodoListPresenter.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 24.09.2021.
//

import UIKit

class TodoListPresenter{
    weak var view: TodoListViewProtocol?
    private let interactor: TodoListInteractorProtocol
    private let router: TodoListRouterProtocol
    var items: [TodoEntity]?
    
    init(view: TodoListViewProtocol,
         interactor: TodoListInteractorProtocol,
         router: TodoListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension TodoListPresenter: TodoListPresenterProtocol {
    func getItemSuccess(item: TodoEntity) {
        router.presentToDoDetailScreen(on: view!, with: item)
        // switch module to TodoDetailModule
    }
    
    func didSelectRowAt(index: Int) {
        interactor.retrieveItem(at: index)
        // do interactor's retrieveItem func
    }
    
    func viewDidLoad() {
        interactor.loadTodos()
        // go to interactor and do loadTodo func
    }
    
    func addTodo(todoTitle: String) {
        print("geldim")
        interactor.addTodo(todoTitle: todoTitle) { (itemResult) in
            switch itemResult {
            case .success(result: let result):
                view?.handleItems(with: result)
            case .failure(error: ):
                print("error")
            }
        }
        // do interactor addtodo func and if it can be do that, do views handleItem(reload TableView)
    }
    func deleteItem(indexPath: IndexPath) {
        interactor.deleteTodo(indexPath: indexPath) { (itemResult) in
            switch itemResult {
            case .success(result: let result):
                view?.handleItems(with: result)
            case .failure(error: _):
                print("error")
            }
        }
        // do interactor deletetodo func and if it can be do that, do views handleItem(reload TableView)
    }
    
    func textLabelText(indexPath: IndexPath) -> String? {
        guard let items = self.items else {
            return nil
        }
        
        return items[indexPath.row].todoItem
        // it returns each TodoItem's string
    }
    
    func numberOfRowsInSection() -> Int {
        guard let items = self.items else {
            return 0
        }
        return items.count
        //  it returns number of todos
    }
    
    func fetchItemSuccess(items: [TodoEntity]) {
        self.items = items
        view?.showTodos(items: items)
        // do view's showTodo func with todoEntity Items
    }
    
}
