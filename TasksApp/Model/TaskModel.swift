//
//  TaskModel.swift
//  TasksApp
//
//  Created by Алексей Орловский on 15.09.2023.
//

import UIKit
import RealmSwift

/// Data model for save tasks 
class Task: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var isCompleted = false
}
