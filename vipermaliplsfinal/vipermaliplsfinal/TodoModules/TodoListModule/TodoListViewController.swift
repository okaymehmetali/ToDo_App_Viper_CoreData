//
//  TodoListViewController.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 24.09.2021.
//

import UIKit

class TodoListViewController: UIViewController {
    
    
    var presenter: TodoListPresenterProtocol?
    
    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewDidLoad()
    }
    
    func setupTableView() {
        todoTableView.register(TodoTableViewCell.nib(), forCellReuseIdentifier: TodoTableViewCell.identifier)
        todoTableView.delegate = self
        todoTableView.dataSource = self
        todoTableView.rowHeight = 40
        todoTableView.contentInsetAdjustmentBehavior = .never
        todoTableView.tableFooterView = UIView()//seperators removed
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        var textField = UITextField()
        let alertController = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.presenter?.addTodo(todoTitle: textField.text!)
        }
        
        alertController.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new todo"
            textField = alertTextField
        }
        
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
    // get UIalert for add ıtem and do presenters addTodo func
}
extension TodoListViewController:  TodoListViewProtocol{
    func handleItems(with results: [TodoEntity]) {
        todoTableView.reloadData()
        // refresh tableview
    }
    
    func showTodos(items: [TodoEntity]) {
        todoTableView.reloadData()
        // show todos in tableview
    }
    
}
extension TodoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(index: indexPath.row)
        todoTableView.deselectRow(at: indexPath, animated: true)
        //do presenters DidSelectRowAt func wiht exact section
    }
}

extension TodoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
        //it returns if there is number of todo item or zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.identifier, for: indexPath) as! TodoTableViewCell
        cell.configure(with: presenter?.textLabelText(indexPath: indexPath))
        
        return cell
        // identifiy cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    // swipe leading to delete
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "delete"){ [weak self] (action, view, completionHandler) in
            self?.presenter?.deleteItem(indexPath: indexPath)
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
}
