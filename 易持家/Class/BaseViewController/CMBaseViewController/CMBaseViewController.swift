//
//  CMBaseViewController.swift
//  易持家
//
//  Created by 王木木 on 16/5/20.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class CMBaseViewController: UIViewController, UITabBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = .Top
    }

    func TitleWithWhiteColor(titleMessage: String) ->UIView{
        
        let title = UILabel()
        title.text = titleMessage;
        title.textColor = UIColor.blueColor()
        title.font = UIFont.boldSystemFontOfSize(17.0)
        title.sizeToFit()
        return title
        
    }
    
}
