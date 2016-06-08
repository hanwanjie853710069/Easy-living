//
//  ELAddExtension.swift
//  EasyLiving
//
//  Created by 王木木 on 16/5/26.
//  Copyright © 2016年 王木木. All rights reserved.
//

import Foundation

extension ELAddVC{
    
    func creatUI(){
        self.view.addSubview(self.tableView)
        
        self.tableView.autoPinEdgeToSuperviewEdge(.Left)
        self.tableView.autoPinEdgeToSuperviewEdge(.Right)
        self.tableView.autoPinEdgeToSuperviewEdge(.Top)
        self.tableView.autoPinEdgeToSuperviewEdge(.Bottom)
        var title = ""
        
        if (city == nil) {
            title = "获取地点"
        }else{
            title = city
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: title, style: .Plain, target: self, action: #selector(self.rightBtn))
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
            cell.rollingLabel.text = queryDataWeather()
            let width = OCTools.getWidthWithContent(cell.rollingLabel.text!, height: 30, font: 16.0)
            cell.rollingLabel.frame.size.width = width
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
        cell.noteTextView.tag = 200 + indexPath.row
        return cell
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView.init(frame: CGRectMake(0, 0, ScreenWidth, 200))
        let footerBtn = UIButton()
        view.addSubview(footerBtn)
        footerBtn.autoPinEdgeToSuperviewEdge(.Left)
        footerBtn.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 60)
        footerBtn.autoPinEdgeToSuperviewEdge(.Right)
        footerBtn.autoSetDimension(.Height, toSize: 40)
        footerBtn.setTitleColor(UIColor.brownColor(), forState: .Normal)
        footerBtn.setTitleColor(MainColore, forState: .Highlighted)
        footerBtn.setTitle("确认", forState: .Normal)
        footerBtn.backgroundColor = MainColore
        footerBtn.addTarget(self, action: #selector(self.creatCoreData), forControlEvents: .TouchUpInside)
        return view
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 160
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    ///  创建选择时间器
    func creatDatePickView(timeBtn: UIButton){
        let dateP = DatePackerView.init(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight))
        dateP.initTimeBack {[unowned self] (timeString) in
            timeBtn.setTitle(timeString, forState: .Normal)
            self.xfTime = timeString
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
            self.syMonery = self.AddToCalculateCell.moneyRemainingLabel.text!
            self.zjeMoney = textFiled.text!
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
    
    //textFiled输入结束后调用
    func changeDataFunc(anyObject: UITextField) {
        
        switch anyObject.tag {
        case 101:
            self.earlyMoney = "0"
            if anyObject.text?.characters.count > 0 {
                self.earlyMoney = (anyObject.text)!
                zzwData.zsMoney = anyObject.text!
            }
        case 102:
            self.inTheMoney = "0"
            if anyObject.text?.characters.count > 0 {
                self.inTheMoney = (anyObject.text)!
                zzwData.zwMoney = anyObject.text!
            }
        case 103:
            self.eveningMoney = "0"
            if anyObject.text?.characters.count > 0 {
                self.eveningMoney = (anyObject.text)!
                zzwData.wsMoney = anyObject.text!
            }
        default:
            print("")
        }
        
        self.AddToCalculateCell.moneyAllLabel.text = String(Float(self.earlyMoney)! + Float(self.inTheMoney)! + Float(self.eveningMoney)!)
        self.xfMonery = self.AddToCalculateCell.moneyAllLabel.text!
        if self.AddToCalculateCell.moneyTextFlied.text?.characters.count > 0 {
            self.AddToCalculateCell.moneyRemainingLabel.text = String(Float(self.AddToCalculateCell.moneyTextFlied.text!)! - Float(self.AddToCalculateCell.moneyAllLabel.text!)!)
            self.syMonery = self.AddToCalculateCell.moneyRemainingLabel.text!
            self.zjeMoney = self.AddToCalculateCell.moneyTextFlied.text!
        }
    }
    
    //textView输入结束后调用
    func changeDataTextViewFunc(anyObject: UITextView){
        
        switch anyObject.tag {
        case 201:
            if anyObject.text?.characters.count > 0 {
                zzwData.zsNote = anyObject.text!
            }
        case 202:
            if anyObject.text?.characters.count > 0 {
                zzwData.zwNote = anyObject.text!
            }
        case 203:
            if anyObject.text?.characters.count > 0 {
                zzwData.wsNote = anyObject.text!
            }
        default:
            print("")
        }
    }
    
    func creatCoreData(){
        
        if queryDataUser().passWord == "" {
            
            let na = CMBaseNavigationController.init(rootViewController: ELLoginVC())
            
            self.navigationController?.presentViewController(na, animated: true, completion: {})
            
            return
        }
        
        if self.zjeMoney == "0" {
            let alertController = UIAlertController(title: "请完善数据",
                                                    message: "总金额不能为空/零", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "确定", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        
        let alertController = UIAlertController(title: "保存提示",
                                                message: "确定保存本地？", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .Default,
                                     handler: {
                                        action in
                                        
                                        ///  存储数据
                                        insertInterformationData(self.zzwData.zsMoney,
                                            zsNote: self.zzwData.zsNote,
                                            zwMoney: self.zzwData.zwMoney,
                                            zwNote: self.zzwData.zwNote,
                                            wsMoney: self.zzwData.wsMoney,
                                            wsNote: self.zzwData.wsNote,
                                            zjeMoney: self.zjeMoney,
                                            xfMonery: self.xfMonery,
                                            syMonery: self.syMonery,
                                            xfTime: self.xfTime)
                                        print("确定")
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func rightBtn(){
        let vc = ELAddressVC()
        vc.initFuncBlock { (cityids, cityName) in
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: cityName, style: .Plain, target: self, action: #selector(self.rightBtn))
            SVProgressHUD.showWithMaskType(.Clear)
            saveWeatherInformation(cityName, cityIds: cityids)
            getTheWeatherInformation(cityids, mathFunction: { (AnyObject) in
                self.tableView.reloadData()
                SVProgressHUD.dismiss()
            })
        }
        self.navigationController?.pushViewController(vc, animated: true)
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
