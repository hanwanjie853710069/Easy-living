//
//  ELAddVC.swift
//  易持家
//
//  Created by 王木木 on 16/5/20.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELAddVC:
    CMBaseViewController,
    UITableViewDelegate,
    dataChangeDelegate,
    UITableViewDataSource{
    
    lazy var tableView : UITableView = {
        let tabV = UITableView.init(frame: CGRectMake(0, 0, 0, 0), style: .Grouped)
        tabV.backgroundColor = UIColor.whiteColor()
        tabV.delegate = self
        tabV.dataSource = self
        tabV.tableFooterView = UIView()
        tabV.showsVerticalScrollIndicator = false
        return tabV
    }()
    
    let dataArray = ["早",
                     "中",
                     "晚"]
    /// 早中晚消费的金额及备注
    var zzwData = (zsMoney: "0",zsNote: "",
                   zwMoney: "0",zwNote: "",
                   wsMoney: "0",wsNote: "")
    
    /// 早中晚消费的金额
    var earlyMoney = "0"
    var inTheMoney = "0"
    var eveningMoney = "0"
    /// 消费时间
    var xfTime = getLocalTime()
    /// 总金额  消费金额  剩余金额
    var zjeMoney = "0"
    var xfMonery = "0"
    var syMonery = "0"
    
    var AddToCalculateCell : AddToCalculateVcCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// 注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.getTheTotalAmount), name:theTotalAmountIds, object: nil)
        creatUI()
    }
    
}

