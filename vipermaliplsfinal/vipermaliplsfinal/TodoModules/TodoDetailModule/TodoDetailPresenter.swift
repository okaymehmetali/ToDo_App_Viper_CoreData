//
//  TodoDetailPresenter.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 26.09.2021.
//

import Foundation

class TodoDetailPresenter {
    weak var view: TodoDetailViewProtocol?
    private let interactor: TodoDetailInteractorProtocol
    private let router: TodoDetailRouterProtocol
    
    init(view: TodoDetailViewProtocol,
         interactor: TodoDetailInteractorProtocol,
         router: TodoDetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
extension TodoDetailPresenter: TodoDetailPresenterProtocol{
    func editItem(title: String) {
        interactor.editItem(title: title)
        view?.handleItem()
        //do interactor edit func and view's handle func(backto todoListModule)
    }
}
