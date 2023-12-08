//
//  TabControllerViewController.swift
//  7Days
//
//  Created by Sudhir Pawar on 04/09/23.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBar.backgroundColor = .black
        
        
//         creating instances
        
        let homeVC = HomeViewController()
        let testVC = TestViewController()
        let profileVC = ProfileViewController()
        
//         set viewcontrollers for the tab
        
        viewControllers = [
           
            UINavigationController(rootViewController: homeVC),
            UINavigationController(rootViewController: testVC),
            UINavigationController(rootViewController: profileVC)
        ]
        
//         customizing tab bar items
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        testVC.tabBarItem = UITabBarItem(title: "Test", image: UIImage(systemName: "pawprint"), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 2)
        
        
        self.navigationItem.largeTitleDisplayMode = .never
        
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//
//    }
//    override func viewDidAppear(_ animated: Bool) {
//        setup()
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//
//    }
//
//    func setup(){
//
//    }
}
