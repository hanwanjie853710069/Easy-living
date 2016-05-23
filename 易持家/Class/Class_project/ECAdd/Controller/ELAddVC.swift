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
    
    var earlyMoney = "0"
    var inTheMoney = "0"
    var eveningMoney = "0"
    
    var AddToCalculateCell : AddToCalculateVcCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.getTheTotalAmount), name:theTotalAmountIds, object: nil)
        creatUI()
    }
    
}

extension ELAddVC{
    
    func creatUI(){
        self.view.addSubview(self.tableView)
        self.tableView.autoPinEdgeToSuperviewEdge(.Left)
        self.tableView.autoPinEdgeToSuperviewEdge(.Right)
        self.tableView.autoPinEdgeToSuperviewEdge(.Top)
        self.tableView.autoPinEdgeToSuperviewEdge(.Bottom)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
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
            cell.initBack { (selectIndex) in
                self.creatDatePickView(cell.timeBtn)
            }
            return cell
        }
        if indexPath.row == 4 {
            let cell =  AddToCalculateVcCell.cellFor(tableView)
            self.AddToCalculateCell = cell
            return cell
        }
        let cell =  AddRiceVcCell.cellFor(tableView)
        cell.delegate = self
        cell.nameLabel.text = dataArray[indexPath.row - 1]
        cell.amountTextFile.tag = 100 + indexPath.row
        return cell
    }
    
    ///  创建选择时间器
    func creatDatePickView(timeBtn: UIButton){
        let dateP = DatePackerView.init(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight))
        dateP.initTimeBack { (timeString) in
            timeBtn.setTitle(timeString, forState: .Normal)
        }
        UIApplication.sharedApplication().keyWindow?.addSubview(dateP)
    }
    
    func getTheTotalAmount(notification:NSNotification){
    
        //获取词典中的值
        let textFiled = notification.object as! UITextField
        //通知的名称
//        let nameNotification = notification.name
        //接收object 对象 一些信息 例如入键盘的一些信息
        //notification.userInfo
        if textFiled.text?.characters.count > 0 {
            self.AddToCalculateCell.moneyRemainingLabel.text = String(Float(textFiled.text!)! - Float(self.AddToCalculateCell.moneyAllLabel.text!)!)
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if cell.respondsToSelector(Selector("setSeparatorInset:")) {
            cell.separatorInset = UIEdgeInsetsZero
        }
        if cell.respondsToSelector(Selector("setLayoutMargins:")) {
            cell.layoutMargins = UIEdgeInsetsZero
        }
    }
    func changeDataFunc(anyObject: UITextField) {
    
            switch anyObject.tag {
            case 101:
                self.earlyMoney = "0"
                if anyObject.text?.characters.count > 0 {
                 self.earlyMoney = (anyObject.text)!
                }
            case 102:
                self.inTheMoney = "0"
                if anyObject.text?.characters.count > 0 {
                    self.inTheMoney = (anyObject.text)!
                }
            case 103:
                self.eveningMoney = "0"
                if anyObject.text?.characters.count > 0 {
                    self.eveningMoney = (anyObject.text)!
                }
            default:
                 print("")
            }
        
        self.AddToCalculateCell.moneyAllLabel.text = String(Float(self.earlyMoney)! + Float(self.inTheMoney)! + Float(self.eveningMoney)!)
        if self.AddToCalculateCell.moneyTextFlied.text?.characters.count > 0 {
             self.AddToCalculateCell.moneyRemainingLabel.text = String(Float(self.AddToCalculateCell.moneyTextFlied.text!)! - Float(self.AddToCalculateCell.moneyAllLabel.text!)!)
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
/**
 删除通知
 NSNotificationCenter.defaultCenter().removeObserver(self, name: "NotificationIdentifier", object: nil)
 NSNotificationCenter.defaultCenter().removeObserver(self)
 */
