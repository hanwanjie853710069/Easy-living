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

extension ELCheckTheDetailsVC{
    
    func creatUI(){
        self.view.addSubview(self.tableView)
        self.tableView.autoPinEdgeToSuperviewEdge(.Left)
        self.tableView.autoPinEdgeToSuperviewEdge(.Right)
        self.tableView.autoPinEdgeToSuperviewEdge(.Top)
        self.tableView.autoPinEdgeToSuperviewEdge(.Bottom)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 4 {
            return 60
        }
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell =  AddTimeVcCell.cellFor(tableView)
            cell.userInteractionEnabled = false
            cell.initBack { (selectIndex) in}
            return cell
        }
        if indexPath.row == 4 {
            let cell =  AddToCalculateVcCell.cellFor(tableView)
            cell.userInteractionEnabled = false
            self.AddToCalculateCell = cell
            return cell
        }
        let cell =  AddRiceVcCell.cellFor(tableView)
        cell.nameLabel.text = dataArray[indexPath.row - 1]
        cell.amountTextFile.tag = 100 + indexPath.row
        cell.userInteractionEnabled = false
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if cell.respondsToSelector(Selector("setSeparatorInset:")) {
            cell.separatorInset = UIEdgeInsetsZero
        }
        if cell.respondsToSelector(Selector("setLayoutMargins:")) {
            cell.layoutMargins = UIEdgeInsetsZero
        }
    }
    
    override func viewDidLayoutSubviews() {
        if self.tableView.respondsToSelector(Selector("setSeparatorInset:")) {
            self.tableView.separatorInset = UIEdgeInsetsZero
        }
        if self.tableView.respondsToSelector(Selector("setLayoutMargins:")) {
            self.tableView.layoutMargins = UIEdgeInsetsZero
        }
        
    }
    
}
