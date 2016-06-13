//
//  CMBaseNavigationController.swift
//  易持家
//
//  Created by 王木木 on 16/5/20.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class CMBaseNavigationController: UINavigationController {
    
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatUI()
    }
    
    func creatUI() {
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        UINavigationBar.appearance().tintColor = DarkGrayTextColor
        
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor(),
                                                            NSFontAttributeName: UIFont(name: "Arial-BoldMT", size: 16.0)!]
        
        if SystemVersion < Float(7) {
            self.navigationBar.tintColor = DarkGrayTextColor
        }else{
            self.navigationBar.barTintColor = MainColore
        }
        
    }
    
    func createTitleView(str: String) ->UIView{
        self.titleLabel.frame = CGRectMake(0, 2, 100, 44)
        self.titleLabel.text = str;
        self.titleLabel.textAlignment = .Center;
        self.titleLabel.backgroundColor = UIColor.clearColor()
        self.titleLabel.font = UIFont.boldSystemFontOfSize(18.0)
        self.titleLabel.textColor = UIColor.whiteColor()
        self.navigationItem.titleView = self.titleLabel;
        return self.navigationItem.titleView!
    }
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if 0 < self.viewControllers.count {
            viewController.hidesBottomBarWhenPushed = true
        }
       super.pushViewController(viewController, animated: true)
    }
    
    func pushViewController(viewController: UIViewController, animated: Bool ,titleLabel:String) {
        if (viewController.navigationItem.titleView == nil){
            viewController.navigationItem.titleView = createTitleView(titleLabel)
        }
        pushViewController(viewController, animated: animated)
    
    }
    
}
