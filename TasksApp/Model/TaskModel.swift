//
//  TaskModel.swift
//  TasksApp
//
//  Created by Алексей Орловский on 15.09.2023.
//

import UIKit

class Task {
    var titleTask: String
    var taskDescription: String
    var topic: String
    
    init(titleTask: String, taskDescription: String, topic: String) {
        self.titleTask = titleTask
        self.taskDescription = taskDescription
        self.topic = topic
    }
}
