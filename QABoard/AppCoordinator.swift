//
//  AppCoordinator.swift
//  QABoard
//
//  Created by raoot0 on 10/30/23.
//

/// TabBarController
///     UINavigationController     UINavigationController ...
///     WriteViewController          SearchViewController ...
///
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    func start()
}

class AppCoordinator: Coordinator {
    
    
    var childCoordinator: [Coordinator] = []
    
    private var tabBarController: QABTabBarController?
    
    init(tabBarController: QABTabBarController) {
        self.tabBarController = tabBarController
        self.tabBarController?.tabBarAction = self
    }
    
    func start() {
        showTabBarController()
    }
    
    func showTabBarController() {
        tabBarController?.setTabViewControllers()
    }
    
}
extension AppCoordinator: QABTabBarAction {
    func qabTabBarItemSelected(_ index: Int) {
        print(index)
    }
}

