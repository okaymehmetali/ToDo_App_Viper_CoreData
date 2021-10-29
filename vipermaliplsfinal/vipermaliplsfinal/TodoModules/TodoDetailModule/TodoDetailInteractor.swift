//
//  TodoDetailInteractor.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 26.09.2021.
//

import Foundation

class TodoDetailInteractor {
    var presenter: TodoDetailPresenterProtocol?
    private var coreDataManager = CoreDataManager.shared
    private let item: TodoEntity
    
    init(item: TodoEntity) {
        self.item = item
    }
}
extension TodoDetailInteractor: TodoDetailInteractorProtocol{
    func editItem(title: String) {
        coreDataManager.editItem(title: title, item: item)
        //edit item in coredata
    }
}
