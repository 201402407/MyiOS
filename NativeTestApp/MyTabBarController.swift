//
//  MyTabBarController.swift
//  NativeTestApp
//
//  Created by LDCC on 2020/07/10.
//  Copyright © 2020 LDCC. All rights reserved.
//

import Foundation
import UIKit

class MyTabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }

    func createTabBar() {
        NSLog("createTabBar 들어옴")
        
        let mainView = ViewController()
//        guard let subView = self.presentingViewController?.storyboard?.instantiateViewController(withIdentifier: "subView") else { return }
//        guard let subView = self.storyboard?.instantiateViewController(withIdentifier: "subView") else { return }
        let subView = SubViewController()
        let thirdView = ThirdViewController()
        let tempView = TempViewController()
        
        let mainViewIcon = UITabBarItem(title: "mainView", image: UIImage(named: "battery-7"), tag: 0)
        mainView.tabBarItem = mainViewIcon
        let subViewIcon = UITabBarItem(title: "subView", image: UIImage(named: "bin-7"), tag: 1)
        subView.tabBarItem = subViewIcon
        let thirdViewIcon = UITabBarItem(title: "thirdView", image: UIImage(named: "basketball-7"), tag: 2)
        thirdView.tabBarItem = thirdViewIcon
        let tempViewIcon = UITabBarItem(title: "tempView", image: UIImage(named: "bin-7"), tag: 3)
        tempView.tabBarItem = tempViewIcon
        
        let controllers = [mainView, subView, thirdView, tempView]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
        self.selectedViewController = thirdView
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
    
}
