//
//  NavigationManager.swift
//  TasksApp
//
//  Created by Алексей Орловский on 12.09.2023.
//

import Foundation
import UIKit

class NavigationManager {
    static let shared = NavigationManager()
    
    func showAuthUserStage() {
        
        let controller = TabBarViewController()
        let navigationController = controller
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        
        sceneDelegate?.window?.rootViewController = navigationController
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    func showNotAuthUserStage() {
        
        let controller = WelcomeViewController()
        let navigationController = controller
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
        
        sceneDelegate?.window?.rootViewController = navigationController
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}
