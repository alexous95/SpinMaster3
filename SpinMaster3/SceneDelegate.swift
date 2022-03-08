//
//  SceneDelegate.swift
//  SpinMaster3
//
//  Created by Alexandre G on 02/03/2022.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder {

    var window: UIWindow?
}

extension SceneDelegate: UIWindowSceneDelegate {

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let gameLevelRouter = GameLevelRouter()
        let contentView = gameLevelRouter.associatedView()
        let nextController = UIHostingController(rootView: contentView)
        gameLevelRouter.navigationController = .init(rootViewController: nextController)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = gameLevelRouter.navigationController
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}
