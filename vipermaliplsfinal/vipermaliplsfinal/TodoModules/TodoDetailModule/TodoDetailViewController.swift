//
//  TodoDetailViewController.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 26.09.2021.
//

import UIKit

class TodoDetailViewController: UIViewController {
    var presenter: TodoDetailPresenterProtocol?
    @IBOutlet weak var editLabel: UILabel!
    @IBOutlet weak var editTextField: UITextField!
    @IBOutlet weak var editButton: UIButton!
    let editLabelText = "Edit your ToDo"
    let editButtonText = "Edit"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup() {
        // label
        editLabel.text = editLabelText
        
        // edit button
        editButton.setTitle(editButtonText, for: .normal)
        editButton.layer.cornerRadius = editButton.frame.height / 2
        editButton.backgroundColor = .cyan
    }
    
    @IBAction func editButtonPressed(_ sender: UIButton) {
        presenter?.editItem(title: editTextField.text!)
        //do presenter edit func
    }
}

extension TodoDetailViewController: TodoDetailViewProtocol{
    func handleItem() {
        navigationController?.popViewController(animated: true)
        // it called after edititem func in detail presenter
    }
    
    
}
