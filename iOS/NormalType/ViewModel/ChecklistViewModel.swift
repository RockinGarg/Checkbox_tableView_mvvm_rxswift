//
//  ChecklistViewModel.swift
//  TableChecklistApp (iOS)
//
//  Created by Jatin Garg on 06/07/21.
//

import Foundation

public var sampleTasksList: [String] = [
    "Turn on Bluetooth",
    "Open Watch App",
    "Start you apple watch and put it in the pairing mode",
    "Open Watch App in the iPhone and scan the code to pair the apple watch",
    "After scanning the code, iPhone and apple watch will start syncing with each other",
    "Wait for few minutes, Let the setup to be complete",
    "After setup, fill the requested details in the watch App and in the health App",
    "Woah!, You are ready to use it."
]

class ChecklistViewModel {
    public var tasksArray = Array<Tasks>()
    public var onDataFetch: ((Array<Tasks>) -> Void)?
    
    func configure(refreshList: @escaping(Array<Tasks>) -> Void) {
        self.onDataFetch = refreshList
    }
    
    public func requestData() {
        tasksArray = sampleTasksList.map({ Tasks(title: $0, completed: false) })
        /// This can be called whenever there's a change in the data
        /// You can directly use the passed object or use the Array reference of this class
        onDataFetch?(tasksArray)
    }
    
    public func updateTask(task: Tasks) {
        guard let index = tasksArray.firstIndex(where: { $0.title.lowercased() == task.title }) else {
            return
        }
        tasksArray[index] = task
        
        /// Option to call onDataFetch?(tasksArray) to refresh the views
    }
}
