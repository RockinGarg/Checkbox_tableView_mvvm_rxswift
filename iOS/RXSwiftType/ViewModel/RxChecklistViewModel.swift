//
//  RxChecklistViewModel.swift
//  TableChecklistApp (iOS)
//
//  Created by Jatin Garg on 06/07/21.
//

import Foundation
import RxSwift

class RxChecklistViewModel {
    public var tasksArray : PublishSubject<[Tasks]> = PublishSubject()
    
    public func requestData() {
        let tasks = sampleTasksList.map({ Tasks(title: $0, completed: false) })
        self.tasksArray.onNext(tasks)
    }
    
}
