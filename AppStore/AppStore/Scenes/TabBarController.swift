//
//  TabBarController.swift
//  AppStore
//
//  Created by Jeongguk Kim on 2022/08/03.
//

import UIKit
import IxMobileSDK

class TabBarController: UITabBarController {

    private lazy var todayViewController: UIViewController = {
        let viewController = TodayViewController()
        let tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "mail"), tag: 0)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var appViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: AppViewController())
        let tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up"), tag: 1)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...1000 {
            let logmaster = IxSecuLogMaster.init()
            _ = logmaster.getEveryLog()
        }
        viewControllers = [todayViewController, appViewController]
    }


}

