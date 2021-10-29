//
//  TodoDetailProtocols.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 26.09.2021.
//

import Foundation

// MARK: - View

protocol TodoDetailViewProtocol: AnyObject {
    var presenter: TodoDetailPresenterProtocol? { get set }
    
    func handleItem()
}

// MARK: - Interactor

protocol TodoDetailInteractorProtocol: AnyObject {
    var presenter: TodoDetailPresenterProtocol? { get set }

    func editItem(title: String)
}

// MARK: - Presenter

protocol TodoDetailPresenterProtocol: AnyObject {
    func editItem(title: String)
}

// MARK: - Router

protocol TodoDetailRouterProtocol: AnyObject {
    static func createTodoDetailModule(with todo: TodoEntity) -> TodoDetailViewController
}
