//
//  ELCheckTheDetailsVC.swift
//  易持家
//
//  Created by 王木木 on 16/5/21.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELCheckTheDetailsVC:
    CMBaseViewController,
    UITableViewDelegate,
UITableViewDataSource{
    
    lazy var tableView : UITableView = {
        let tabV = UITableView()
        tabV.backgroundColor = UIColor.whiteColor()
        tabV.delegate = self
        tabV.dataSource = self
        tabV.tableFooterView = UIView()
        return tabV
    }()
    
    var infDetails :Information!
    
    let dataArray = ["早",
                     "中",
                     "晚"]
    
    var AddToCalculateCell : AddToCalculateVcCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "详情列表"
        self.view.backgroundColor = UIColor.whiteColor()
        creatUI()
    }
    
}

