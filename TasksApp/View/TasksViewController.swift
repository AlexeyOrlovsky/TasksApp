//
//  ViewController.swift
//  TasksApp
//
//  Created by Алексей Орловский on 09.09.2023.
//

import UIKit

class TasksViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewDidLoad()
    }
    
    func setupViewDidLoad() {
        title = "Tasts"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

