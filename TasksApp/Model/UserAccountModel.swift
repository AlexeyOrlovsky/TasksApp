//
//  UserAccountModel.swift
//  TasksApp
//
//  Created by Алексей Орловский on 12.09.2023.
//

import RealmSwift

class UserAccountModel: Object {
    @Persisted var email: String = ""
    @Persisted var password: String = ""
}
