//
//  SceneDelegate.swift
//  TasksApp
//
//  Created by Алексей Орловский on 09.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        ///
        window?.rootViewController = UINavigationController(rootViewController: WelcomeViewController())
    }
}

