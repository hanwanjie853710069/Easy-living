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
                                        backImage:getBackImage(),
                                        mySelf:self)
        
        
        return hV
        
    }()
    
    var dataArray: [Dictionary<String,String?>] {
        get{
            
            let array = [["name":"昵称",   "image":"nick_image", "content":queryDataUser().nickName],
                         ["name":"性别",   "image":"sex_image", "content":queryDataUser().sex],
                         ["name":"生日","image":"birthdad_image", "content":queryDataUser().age]]
            return array
            
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.tableView.tableHeaderView = self.heardView
        
        self.view.addSubview(self.tableView)
        
        reloadTableView()
        
    }
    
}
