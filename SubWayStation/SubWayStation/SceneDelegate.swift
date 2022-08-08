//
//  SceneDelegate.swift
//  SubWayStation
//
//  Created by jeongguk on 2022/08/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowSecen = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowSecen)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = UINavigationController(rootViewController: StationSearchViewController())
        window?.makeKeyAndVisible()
    }


}

