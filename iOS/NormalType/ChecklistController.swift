//
//  ChecklistController.swift
//  ChecklistUI
//
//  Created by Jatin Garg on 06/07/21.
//

import UIKit
import ChecklistUI

class ChecklistController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var viewModel = ChecklistViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        self.listTableView.tableFooterView = UIView()
        viewModel.configure { taskList in
            self.listTableView.reloadData()
        }
        viewModel.requestData()
    }
    
    func registerNibs() {
        listTableView.register(UINib(nibName: "NormalListCell", bundle: nil), forCellReuseIdentifier: "NormalListCell")
    }
    
    func taskActionChanged(task: Tasks) {
        print("Changes status: \(task.isCompleted)")
        /// We got change in the task now.
        /// Update the same in Viewmodel as that's our final one
        viewModel.updateTask(task: task)
    }
}

extension ChecklistController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tasksArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NormalListCell", for: indexPath) as? NormalListCell {
            cell.setup(task: viewModel.tasksArray[indexPath.row], onClick: taskActionChanged(task:))
            return cell
        }
        return UITableViewCell()
    }
}
