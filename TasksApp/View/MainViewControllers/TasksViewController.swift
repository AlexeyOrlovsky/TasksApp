//
//  ViewController.swift
//  TasksApp
//
//  Created by Алексей Орловский on 09.09.2023.
//

import UIKit
import RealmSwift

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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    var tasks: Results<Task>!
    
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
        
        view.addSubview(collectionView)
        
        collectionView.register(TasksCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.frame = view.bounds
        
        do {
            let realm = try Realm()
            tasks = realm.objects(Task.self)
        } catch {
            /// error handling from Realm
            print("Ошибка загрузки задач: \(error.localizedDescription)")
        }
    }
}

/// UICollectionViewDataSource & UICollectionViewDelegateFlowLayout
extension TasksViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? TasksCollectionViewCell
        let task = tasks[indexPath.item]
        cell?.titleLabel.text = task.title
        cell?.backgroundColor = backgroundColorCell.randomElement()
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 80)
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
    }
}
