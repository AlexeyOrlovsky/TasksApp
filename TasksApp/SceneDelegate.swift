//
//  SceneDelegate.swift
//  TasksApp
//
//  Created by Алексей Орловский on 09.09.2023.
//

import UIKit
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        /// registration User Stages
        let config = Realm.Configuration(
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in
                //
            })
        
        Realm.Configuration.defaultConfiguration = config
        
        /// Creating window and add main controller
        let realm = try? Realm()
        if (realm?.objects(UserAccountModel.self).first) != nil {
            NavigationManager.shared.showAuthUserStage()
        } else {
            NavigationManager.shared.showNotAuthUserStage()
        }
    }
}

