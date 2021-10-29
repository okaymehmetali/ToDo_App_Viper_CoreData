//
//  TodoTableViewCell.swift
//  vipermaliplsfinal
//
//  Created by Mehmet Okay on 24.09.2021.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var todoCellLabel: UILabel!
    static let identifier = "TodoTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "TodoTableViewCell", bundle: nil)
    }
    
    public func configure(with title: String?) {
        todoCellLabel.text = title
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
