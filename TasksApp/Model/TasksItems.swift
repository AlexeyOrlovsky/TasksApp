//
//  TasksItems.swift
//  TasksApp
//
//  Created by Алексей Орловский on 15.09.2023.
//

import UIKit
import RealmSwift

class TasksItems: Object {
    @Persisted var titleTask: String = ""
    @Persisted var taskDescription: String = ""
    @Persisted var topic: String = ""
}
