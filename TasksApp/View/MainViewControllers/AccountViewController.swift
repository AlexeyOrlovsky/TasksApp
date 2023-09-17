//
//  AccountViewController.swift
//  TasksApp
//
//  Created by Алексей Орловский on 12.09.2023.
//

import UIKit
import RealmSwift

class AccountViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewDidLoad()
    }
    
    func setupViewDidLoad() {
        title = "Account"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "door.right.hand.open"), style: .done, target: self, action: #selector(rightBarButtonAction))
        navigationItem.rightBarButtonItem?.tintColor = .systemGray
    }
}

/// @objc funcs
extension AccountViewController {
    
    @objc func rightBarButtonAction() {
        
        let realm = try? Realm()
        
        if let deleteUser = realm?.objects(UserAccountModel.self).first {
            try? realm?.write({
                realm?.delete(deleteUser)
            })
        }
        NavigationManager.shared.showNotAuthUserStage()
    }
}
