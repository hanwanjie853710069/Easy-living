//
//  ELAddressVC.swift
//  EasyLiving
//
//  Created by 王木木 on 16/5/26.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELAddressVC:
    CMBaseViewController,
    UITableViewDelegate,
    UITableViewDataSource,
    UISearchBarDelegate{
    
    lazy var tableView : UITableView = {
        let tabV = UITableView.init(frame: self.view.bounds, style: .Plain)
        tabV.delegate = self
        tabV.dataSource = self
        tabV.tableFooterView = UIView()
        tabV.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20)
        return tabV
        
    }()
    
    var funcBlock = {(cityids:String ,cityName:String)->() in}
    
    let cellid = "cellid"
    var arrayData :NSMutableArray = []
    var arrayTemp :NSMutableArray = []
    
    lazy var searchbar:UISearchBar = {
    let searc = UISearchBar.init(frame: CGRectMake(0, 0, ScreenWidth, 40))
        searc.delegate = self
        return searc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "地点"
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.tableView)
        getData()
    }

}

