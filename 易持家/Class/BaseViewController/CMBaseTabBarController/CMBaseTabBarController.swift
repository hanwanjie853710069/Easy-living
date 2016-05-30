//
//  CMBaseTabBarController.swift
//  易持家
//
//  Created by 王木木 on 16/5/20.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class CMBaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTabbarViewController()
        let backView = UIView.init(frame: CGRectMake(0, 0, ScreenWidth, 49))
        backView.backgroundColor = LightGrayBgColor
        self.tabBar.insertSubview(backView, atIndex: 0)
        self.tabBar.opaque = true
    }
    
    func loadTabbarViewController(){
        self.tabBar.tintColor = UIColor(forHexString: "#1CB9D2")
        self.tabBar.backgroundColor = UIColor(forHexString: "#F6F6F6")
        let addVC = ELAddVC()
        addVC.title = "添加"
        addVC.tabBarItem.image = UIImage(named: "set_add")
        addVC.tabBarItem.selectedImage = UIImage(named: "set_add_select")
        let addNa = CMBaseNavigationController(rootViewController:addVC);
        
        let homeVC = ELHomePageVC()
        homeVC.title = "展示"
        homeVC.tabBarItem.image = UIImage(named: "set_page")
        homeVC.tabBarItem.selectedImage = UIImage(named: "set_page_select")
        let homeNa = CMBaseNavigationController(rootViewController:homeVC);
        
        let lookVC = ELLookVC()
        lookVC.title = "查看"
        lookVC.tabBarItem.image = UIImage(named: "set_look")
        lookVC.tabBarItem.selectedImage = UIImage(named: "set_look_select")
        let lookNa = CMBaseNavigationController(rootViewController:lookVC);
   
        let myVC = ELMyViewController()
        myVC.title = "我的"
        myVC.tabBarItem.image = UIImage(named: "set_my")
        myVC.tabBarItem.selectedImage = UIImage(named: "set_my_select")
        let myNa = CMBaseNavigationController(rootViewController:myVC);
        
        self.viewControllers = [lookNa,homeNa,addNa,myNa]
    }
    
}
