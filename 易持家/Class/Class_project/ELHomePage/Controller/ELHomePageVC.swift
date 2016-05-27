//
//  ELHomePageVC.swift
//  易持家
//
//  Created by 王木木 on 16/5/20.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELHomePageVC:
    CMBaseViewController,
    UITableViewDelegate,
UITableViewDataSource {
    
    lazy var tableView : UITableView = {
        let tabV = UITableView.init(frame: self.view.bounds)
        tabV.delegate = self
        tabV.dataSource = self
        tabV.tableFooterView = UIView()
        tabV.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20)
        return tabV
    }()
    var arrayData:[String] = {
        let array = ["单组--柱状图","单组--线状图"]
        return array
    }()
    
    let cellid = "ELHomePageVCCellids"
    
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

extension ELHomePageVC{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellid)
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: self.cellid)
        }
        cell?.textLabel?.text = self.arrayData[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc = ELASingleSetOfHistogramVC()
            vc.title = "单组--柱状图"
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = ELASingleSetOfLinearGraphVC()
            vc.title = "单组--线状图"
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print("")
        }
        
    }
}


