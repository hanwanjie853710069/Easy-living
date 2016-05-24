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
    dataChangeDelegate,
    UITableViewDelegate,
    UIAlertViewDelegate,
    UITableViewDataSource{
    
    lazy var tableView : UITableView = {
        let tabV = UITableView()
        tabV.backgroundColor = UIColor.whiteColor()
        tabV.delegate = self
        tabV.dataSource = self
        tabV.tableFooterView = UIView()
        return tabV
    }()
    
    var infDetails: Information!
    
    var tiHuanInf: Information!
    
    
    let dataArray = ["早",
                     "中",
                     "晚"]
    
    //是否可以编辑
    var ModifyBool:Bool = false
    
    /// 早中晚消费的金额及备注
    var zzwData = (zsMoney: "0",zsNote: "",
                   zwMoney: "0",zwNote: "",
                   wsMoney: "0",wsNote: "")
    
    /// 早中晚消费的金额
    var earlyMoney = "0"
    var inTheMoney = "0"
    var eveningMoney = "0"
    
    /// 总金额  消费金额  剩余金额
    var zjeMoney = "0"
    var xfMonery = "0"
    var syMonery = "0"
    
    var AddToCalculateCell : AddToCalculateVcCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        self.title = "详情列表"
        self.view.backgroundColor = UIColor.whiteColor()
        creatUI()
        
        /// 注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.getMonery), name:theTotalAmountIds, object: nil)
    }
    
}

