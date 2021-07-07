//
//  RxChecklistController.swift
//  TableChecklistApp (iOS)
//
//  Created by Jatin Garg on 06/07/21.
//

import UIKit
import RxSwift
import RxCocoa

class RxChecklistController: UIViewController {
    
    @IBOutlet weak var rxListTableView: UITableView!
    var viewModel = RxChecklistViewModel()
    let disposeBag = DisposeBag()
    var tasksArray = PublishSubject<Array<Tasks>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBindings()
        viewModel.requestData()
    }
    
    func taskActionChanged(task: Tasks) {
        print("Changes status: \(task.isCompleted)")
        /// We got change in the task now.
        /// Update the same in Viewmodel as that's our final one
    }
    
    private func setUpBindings() {
        rxListTableView.register(UINib(nibName: "NormalListCell", bundle: nil), forCellReuseIdentifier: "NormalListCell")
        
        /* ---> If you need to bind and perform some set of operation based on this
        viewModel
            .tasksArray
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { newTasks in
                print(newTasks.count)
            }, onCompleted: {
                print("refresh TableView")
            })
            .disposed(by: disposeBag)
        */
        
        viewModel.tasksArray.bind(to: rxListTableView.rx.items) { (tv, row, item) -> UITableViewCell in
            if let cell = tv.dequeueReusableCell(withIdentifier: "NormalListCell", for: IndexPath.init(row: row, section: 0)) as? NormalListCell {
                cell.setup(task: item, onClick: self.taskActionChanged(task:))
                return cell
            }
            return UITableViewCell()
        }.disposed(by: disposeBag)
    }
}
