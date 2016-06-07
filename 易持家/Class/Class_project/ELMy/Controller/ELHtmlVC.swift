//
//  ELHtmlVC.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/7.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit
import Foundation
import CoreFoundation
class ELHtmlVC: CMBaseViewController,
                DTAttributedTextContentViewDelegate ,
                RETableViewManagerDelegate,
    DTLazyImageViewDelegate
    
                {
    
    lazy var tableView: UITableView = {
        
        let tab = UITableView.init(frame: self.view.bounds, style: .Plain)
        
        tab.tableFooterView = UIView()
        
        return tab
        
    }()
    
    lazy var manager: RETableViewManager = {
        
        let man = RETableViewManager.init(tableView: self.tableView)
        
        man.delegate = self
        
        man.registerClass("ELMySectonItem", forCellWithReuseIdentifier: "ELMyHtmlCell")
        
        return man
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.darkGrayColor()
        
        self.view.addSubview(self.tableView)
        
        let section = RETableViewSection.init()
        
        let item = ELMySectonItem.init(title: "", htmlString: "")
        
        section.addItem(item)
        
        self.manager.addSection(section)
    }
    
    
}
