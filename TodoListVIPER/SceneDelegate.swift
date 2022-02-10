//
//  SceneDelegate.swift
//  TodoListVIPER
//
//  Created by Thiago Henrique Alves Ferreira on 07/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let todoListView = TodoListRouter.createTodoListModule()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = todoListView
        self.window?.windowScene = windowScene
        self.window?.makeKeyAndVisible()
    }
}

