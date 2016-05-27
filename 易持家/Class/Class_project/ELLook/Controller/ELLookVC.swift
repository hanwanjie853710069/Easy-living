//
//  ELLookVC.swift
//  易持家
//
//  Created by 王木木 on 16/5/20.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELLookVC:
    CMBaseViewController,
    UITableViewDelegate,
UITableViewDataSource{
    
    lazy var tableView : UITableView = {
        let tabV = UITableView.init(frame: self.view.bounds)
        tabV.delegate = self
        tabV.dataSource = self
        tabV.tableFooterView = UIView()
        tabV.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20)
        return tabV
    }()
    var arrayData:[Information] = {
        let array = queryDataInformation()
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.tableView)
        self.tableView.autoPinEdgeToSuperviewEdge(.Bottom)
        self.tableView.autoPinEdgeToSuperviewEdge(.Left)
        self.tableView.autoPinEdgeToSuperviewEdge(.Right)
        self.tableView.autoPinEdgeToSuperviewEdge(.Top)
    }
}

