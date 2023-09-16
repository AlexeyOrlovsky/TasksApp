//
//  TabBarViewController.swift
//  TasksApp
//
//  Created by Алексей Орловский on 12.09.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        viewControllers = [
            UINavigationController(rootViewController: viewController(viewController: TasksViewController(), title: "Tasks", image: UIImage(systemName: "list.bullet.rectangle.portrait")!)),
            UINavigationController(rootViewController: viewController(viewController: AccountViewController(), title: "Account", image: UIImage(systemName: "person.fill")!))
        ]
    }
    
    func viewController(viewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        tabBar.tintColor = .lightGray
        tabBar.unselectedItemTintColor = .systemGray2
        return viewController
    }
}
