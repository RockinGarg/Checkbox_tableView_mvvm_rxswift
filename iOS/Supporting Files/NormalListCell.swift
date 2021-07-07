//
//  NormalListCell.swift
//  TableChecklistApp (iOS)
//
//  Created by Jatin Garg on 06/07/21.
//

import UIKit
import ChecklistUI

class NormalListCell: UITableViewCell {
    
    @IBOutlet weak var isCompletedButton: ChecklistCheckmark!
    @IBOutlet weak var titleLabel: UILabel!
    var task: Tasks!
    var onClick: ((Tasks) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(task: Tasks, onClick: @escaping (Tasks) -> Void) {
        self.task = task
        self.onClick = onClick
        self.titleLabel.text = task.title
        self.isCompletedButton.checked = task.isCompleted
        
    }
    
    @IBAction func completedTaskAction(_ sender: Any) {
        self.task.isCompleted = !self.task.isCompleted
        self.isCompletedButton.checked = self.task.isCompleted
        onClick?(self.task)
    }
    
}
