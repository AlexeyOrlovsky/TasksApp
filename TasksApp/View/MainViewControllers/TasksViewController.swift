//
//  ViewController.swift
//  TasksApp
//
//  Created by Алексей Орловский on 09.09.2023.
//

import UIKit

class TasksViewController: UIViewController {
    
    /// Background Color Cell
    let backgroundColorCell = [
        UIColor(red: 118/255, green: 19/255, blue: 20/255, alpha: 1),
        UIColor(red: 154/255, green: 109/255, blue: 43/255, alpha: 1),
        UIColor(red: 132/255, green: 163/255, blue: 45/255, alpha: 1),
        UIColor(red: 42/255, green: 149/255, blue: 104/255, alpha: 1),
        UIColor(red: 52/255, green: 140/255, blue: 146/255, alpha: 1),
        UIColor(red: 46/255, green: 65/255, blue: 150/255, alpha: 1),
        UIColor(red: 94/255, green: 35/255, blue: 132/255, alpha: 1),
        UIColor(red: 147/255, green: 34/255, blue: 102/255, alpha: 1)
    ]
    
    let tasks = TasksItems()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewDidLoad()
        setupCollectionView()
    }
    
    func setupViewDidLoad() {
        title = "Tasts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .done, target: self, action: #selector(rightBarButtonAction))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    func setupCollectionView() {
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
    }
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "task"
        cell.backgroundColor = backgroundColorCell.randomElement()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

/// @objc func
extension TasksViewController {
    
    @objc func rightBarButtonAction() {
        
        let vc = CreateTaskViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
