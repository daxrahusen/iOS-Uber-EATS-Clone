//
//  TabBarController.swift
//  UberEatsTest
//
//  Created by Dax Rahusen on 29/03/2017.
//  Copyright © 2017 Dax. All rights reserved.
//

import UIKit
import Hero

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        isHeroEnabled = true

        let homeVC = setupVC(selectedImage: #imageLiteral(resourceName: "home_selected"), unselectedImage: #imageLiteral(resourceName: "home_unselected"), viewcontroller: ViewController())
        
        let searchVC = setupVC(selectedImage: #imageLiteral(resourceName: "search_selected"), unselectedImage: #imageLiteral(resourceName: "search_unselected"))
        
        let profileVC = setupVC(selectedImage: #imageLiteral(resourceName: "profile_selected"), unselectedImage: #imageLiteral(resourceName: "profile_unselected"))
        
        viewControllers = [homeVC, searchVC, profileVC]
        
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
        }
        
    }
    
    private func setupVC(selectedImage: UIImage, unselectedImage: UIImage, viewcontroller: UIViewController = UIViewController()) -> UIViewController {
        
        let vc = viewcontroller
        vc.view.backgroundColor = .white
        vc.tabBarItem.image = unselectedImage
        vc.tabBarItem.selectedImage = selectedImage
        
        return vc
    }

}
