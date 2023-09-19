//
//  ViewController.swift
//  TasksApp
//
//  Created by Алексей Орловский on 09.09.2023.
//

import UIKit
import RealmSwift

class TasksViewController: UIViewController {
    
    let realm = try! Realm()
    
    /// Background Colors Cell
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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    var tasks: Results<Task>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewDidLoad()
        setupCollectionView()
    }
    
    func setupViewDidLoad() {
        view.backgroundColor = .systemBackground
        
        title = "Tasts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .done, target: self, action: #selector(rightBarButtonAction))
        navigationItem.rightBarButtonItem?.tintColor = .label
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.register(TasksCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.frame = view.bounds
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        configureGetTasks()
    }
    
    func configureGetTasks() {
        do {
            let realm = try Realm()
            self.tasks = realm.objects(Task.self).sorted(byKeyPath: "createdAt", ascending: false)
        } catch {
            print("Ошибка при получении данных из Realm: \(error)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
}

// MARK: UICollectionViewDataSource & UICollectionViewDelegateFlowLayout & UICollectionViewDelegate
extension TasksViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TasksCollectionViewCell
        let task = tasks[indexPath.item]
        cell.titleLabel.text = task.title
        cell.taskDescriptionLabel.text = task.taskDescription
        cell.topicLabel.text = task.topic
        cell.backgroundColor = backgroundColorCell[indexPath.item % backgroundColorCell.count]
        cell.layer.cornerRadius = 20
        
        cell.deleteAction = { [weak self] in
            guard let self = self else { return }

            /// deleting item from database Realm
            let taskToDelete = self.tasks[indexPath.item]
            
            do {
                let realm = try Realm()
                try realm.write {
                    realm.delete(taskToDelete)
                }
            } catch {
                print("Ошибка при удалении объекта из Realm: \(error)")
                return
            }

            /// update data and delete item animation
            collectionView.performBatchUpdates({
                self.configureGetTasks() /// update data
                collectionView.deleteItems(at: [indexPath]) /// animation delete item
            })
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

/// @objc func
extension TasksViewController {
    
    @objc func rightBarButtonAction() {
        
        let vc = CreateTaskViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
        print("hello!")
    }
}
