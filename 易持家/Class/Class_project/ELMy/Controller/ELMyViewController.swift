//
//  ELMyViewController.swift
//  EasyLiving
//
//  Created by 王木木 on 16/5/30.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit


class ELMyViewController:
      CMBaseViewController ,
      RETableViewManagerDelegate{
    
    lazy var tableView: UITableView = {
        
        let tab = UITableView.init(frame: self.view.bounds, style: .Plain)
        
        tab.delegate = self
        
        tab.tableFooterView = UIView()
        
        tab.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20)
        
        return tab
        
    }()
    
    lazy var manager: RETableViewManager = {
        
        let man = RETableViewManager.init(tableView: self.tableView)
        
        man.delegate = self
        
        man.registerClass("MyViewItem", forCellWithReuseIdentifier: "MyViewRECell")
        
        return man
        
    }()
    
    lazy var heardView: ELMyCellHeardView = {
        
        let hV = ELMyCellHeardView.init(frame: CGRectMake(0, 64, ScreenWidth, 200),
                                        nameLabel: queryDataUser().nickName!,
                                        heardImageUrl: getHeardImage(),
                                        backImage:"Iocn_El",
                                        mySelf:self)
    
        
        return hV
        
    }()
    
    let dataArray = [["name":"昵称",   "image":"myPage_icon"],
                     ["name":"性别",   "image":"myPage_icon"],
                     ["name":"年龄","image":"myPage_icon"],
                     ["name":"个性签名","image":"myPage_icon"]]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.tableView.tableHeaderView = self.heardView
        
        self.view.addSubview(self.tableView)
        
        let section = RETableViewSection.init()
        
        for dict in dataArray {
            
            let item = MyViewItem.init(title: dict["name"]!, imageNameS: dict["image"]!, myItem: { (myItem) in })
            
            section.addItem(item)
            
        }
        
        self.manager.addSection(section)
        
    }

    
}
