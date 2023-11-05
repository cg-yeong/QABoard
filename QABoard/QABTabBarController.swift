//
//  QABTabBarController.swift
//  QABoard
//
//  Created by raoot0 on 10/30/23.
//

import UIKit

protocol QABTabBarAction {
    func qabTabBarItemSelected(_ index: Int)
}

enum QABTabMenu: Int {
    case home = 0
    case questions = 1
}


class QABTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    lazy var qabMenuViewControllers: [UIViewController] = [homeVC]
    
    private let homeVC: UIViewController = {
        let vc = ViewController()
        vc.tabBarItem = .init(title: nil, image: UIImage(named: "house"), selectedImage: nil)
        
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }()
    
    var tabBarAction: QABTabBarAction?
    
    init(tabBarAction: QABTabBarAction? = nil) {
        self.tabBarAction = tabBarAction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public func setTabViewControllers() {
        let vcs = [homeVC]
        self.viewControllers = vcs
        self.selectedIndex = 0
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        tabBarAction?.qabTabBarItemSelected(tabBarController.selectedIndex)
    }
    
    
    
}
