//
//  TodoListRouter.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 24.09.2021.
//

import Foundation

class TodoListRouter: TodoListRouterProtocol {
    static func createTodoListModule() -> TodoListViewController {
        
        let view = TodoListViewController()
        let router: TodoListRouterProtocol = TodoListRouter()
        let interactor: TodoListInteractorProtocol = TodoListInteractor()
        let presenter: TodoListPresenterProtocol = TodoListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
        //create TodoLİst module
    }
    
    func presentToDoDetailScreen(on view: TodoListViewProtocol, with item: TodoEntity) {
        let todoDetailViewController = TodoDetailRouter.createTodoDetailModule(with: item)
        
        let viewController = view as! TodoListViewController
        viewController.navigationController?.pushViewController(todoDetailViewController, animated: true)
        // create todoDetailmodule and go there
        
    }
    
}
