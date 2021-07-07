//
//  Task.swift
//  TableChecklistApp (iOS)
//
//  Created by Jatin Garg on 06/07/21.
//

import Foundation

struct Task: Codable {
    let title: String
    let isCompleted: Bool
    
    enum CodingKeys: String, CodingKey {
        case title, isCompleted
    }
}

public class Tasks {
    var title: String = ""
    var isCompleted: Bool = false
    
    init(title: String = "" , completed: Bool = false) {
        self.title = title
        self.isCompleted = completed
    }
}
