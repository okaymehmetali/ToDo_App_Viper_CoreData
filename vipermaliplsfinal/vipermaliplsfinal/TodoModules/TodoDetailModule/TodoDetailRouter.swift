//
//  TodoDetailRouter.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 26.09.2021.
//

import Foundation

class TodoDetailRouter: TodoDetailRouterProtocol {
    static func createTodoDetailModule(with todo: TodoEntity) -> TodoDetailViewController {
        
        let view = TodoDetailViewController()
        let router: TodoDetailRouterProtocol = TodoDetailRouter()
        let interactor: TodoDetailInteractorProtocol = TodoDetailInteractor(item: todo)
        let presenter: TodoDetailPresenterProtocol = TodoDetailPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}
