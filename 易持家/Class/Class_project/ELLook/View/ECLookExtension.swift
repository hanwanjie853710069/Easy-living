//
//  ECLookExtension.swift
//  易持家
//
//  Created by 王木木 on 16/5/24.
//  Copyright © 2016年 王木木. All rights reserved.
//

import Foundation


extension ELCheckTheDetailsVC{
    
    func creatUI(){
        self.view.addSubview(self.tableView)
        self.tableView.autoPinEdgeToSuperviewEdge(.Left)
        self.tableView.autoPinEdgeToSuperviewEdge(.Right)
        self.tableView.autoPinEdgeToSuperviewEdge(.Top)
        self.tableView.autoPinEdgeToSuperviewEdge(.Bottom)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "编辑", style: .Plain, target: self, action: #selector(self.rightBtn))
    }
    
    func rightBtn(btnItem: UIBarButtonItem){
        UIApplication.sharedApplication().keyWindow!.endEditing(true)
        if  btnItem.title == "编辑" {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "完成", style: .Plain, target: self, action: #selector(self.rightBtn))
            self.ModifyBool = true
            self.tableView.reloadData()
        }else{
            if self.zjeMoney == "0" {
                let altshow = UIAlertView.init(title: "请完善数据", message: "总金额不能为空/零", delegate: nil, cancelButtonTitle: "确定")
                altshow.show()
                return
            }
            let alt = UIAlertView.init(title: "数据修改", message: "是否修改", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "保存")
            alt.show()
        }
    }
    
    func getData(){
        
        self.tiHuanInf = self.infDetails
        
        zzwData.zsMoney = self.infDetails.zsMoney!
        zzwData.zsNote  = self.infDetails.zsNote!
        zzwData.zwMoney = self.infDetails.zwMoney!
        zzwData.zwNote  = self.infDetails.zwNote!
        zzwData.wsMoney = self.infDetails.wsMoney!
        zzwData.wsNote  = self.infDetails.wsNote!
        /// 早中晚消费的金额
        self.earlyMoney   = self.infDetails.zsMoney!
        self.inTheMoney   = self.infDetails.zwMoney!
        self.eveningMoney = self.infDetails.wsMoney!
        /// 总金额  消费金额  剩余金额
        self.zjeMoney = self.infDetails.zjeMoney!
        self.xfMonery = self.infDetails.xfAllMoney!
        self.syMonery = self.infDetails.syMoney!
    }
    
    func getMonery(notification:NSNotification){
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
            self.tiHuanInf.syMoney = self.syMonery
            self.tiHuanInf.zjeMoney = self.zjeMoney
        }
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
            cell.userInteractionEnabled = false
            cell.initBack { (selectIndex) in}
            cell.timeBtn.setTitle(infDetails.xfTime, forState: .Normal)
            cell.rollingLabel.text = self.infDetails.weather
            print(self.infDetails.weather)
            return cell
        }
        if indexPath.row == 4 {
            let cell =  AddToCalculateVcCell.cellFor(tableView)
            if self.ModifyBool {
                cell.userInteractionEnabled = true
            }else{
                cell.userInteractionEnabled = false
                cell.moneyAllLabel.text = tiHuanInf.xfAllMoney
                cell.moneyTextFlied.text = tiHuanInf.zjeMoney
                cell.moneyRemainingLabel.text = tiHuanInf.syMoney
            }
            
            self.AddToCalculateCell = cell
            return cell
        }
        let cell =  AddRiceVcCell.cellFor(tableView)
        cell.nameLabel.text = dataArray[indexPath.row - 1]
        cell.amountTextFile.tag = 100 + indexPath.row
        cell.delegate = self
        if self.ModifyBool {
            cell.userInteractionEnabled = true
        }else{
            cell.userInteractionEnabled = false
            
            switch indexPath.row {
            case 1:
                cell.amountTextFile.text = tiHuanInf.zsMoney
                cell.noteTextView.text = tiHuanInf.zsNote
            case 2:
                cell.amountTextFile.text = tiHuanInf.zwMoney
                cell.noteTextView.text = tiHuanInf.zwNote
            case 3:
                cell.amountTextFile.text = tiHuanInf.wsMoney
                cell.noteTextView.text = tiHuanInf.wsNote
            default:
                print("")
            }
        }
        
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
    
    //textFiled输入结束后调用
    func changeDataFunc(anyObject: UITextField) {
        
        switch anyObject.tag {
        case 101:
            self.earlyMoney = "0"
            if anyObject.text?.characters.count > 0 {
                self.earlyMoney = (anyObject.text)!
                zzwData.zsMoney = anyObject.text!
                self.tiHuanInf.zsMoney = anyObject.text!
            }else{
                self.earlyMoney = "0"
                zzwData.zsMoney = "0"
                self.tiHuanInf.zsMoney = "0"
            }
        case 102:
            self.inTheMoney = "0"
            if anyObject.text?.characters.count > 0 {
                self.inTheMoney = (anyObject.text)!
                zzwData.zwMoney = anyObject.text!
                self.tiHuanInf.zwMoney = anyObject.text!
            }else{
                self.inTheMoney = "0"
                zzwData.zwMoney = "0"
                self.tiHuanInf.zwMoney = "0"
            }
        case 103:
            self.eveningMoney = "0"
            if anyObject.text?.characters.count > 0 {
                self.eveningMoney = (anyObject.text)!
                zzwData.wsMoney = anyObject.text!
                self.tiHuanInf.wsMoney = anyObject.text!
            }else{
                self.eveningMoney = "0"
                zzwData.wsMoney = "0"
                self.tiHuanInf.wsMoney = "0"
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
            self.tiHuanInf.syMoney = self.syMonery
            self.tiHuanInf.zjeMoney = self.zjeMoney
            self.tiHuanInf.xfAllMoney = self.xfMonery
        }
    }
    
    //textView输入结束后调用
    func changeDataTextViewFunc(anyObject: UITextView){
        
        switch anyObject.tag {
        case 201:
            if anyObject.text?.characters.count > 0 {
                zzwData.zsNote = anyObject.text!
                self.tiHuanInf.zsNote = anyObject.text!
            }else{
                zzwData.zsNote = "0"
                self.tiHuanInf.zsNote = "0"
            }
        case 202:
            if anyObject.text?.characters.count > 0 {
                zzwData.zwNote = anyObject.text!
                self.tiHuanInf.zwNote = anyObject.text!
            }else{
                zzwData.zsNote = "0"
                self.tiHuanInf.zsNote = "0"
            }
        case 203:
            if anyObject.text?.characters.count > 0 {
                zzwData.wsNote = anyObject.text!
                self.tiHuanInf.wsNote = anyObject.text!
            }else{
                zzwData.zsNote = "0"
                self.tiHuanInf.zsNote = "0"
            }
        default:
            print("")
        }
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "编辑", style: .Plain, target: self, action: #selector(self.rightBtn))
            self.ModifyBool = false
            self.tableView.reloadData()
            
            ///  存储数据
            modifyTheInterformationData(zzwData.zsMoney,
                                        zsNote: zzwData.zsNote,
                                        zwMoney: zzwData.zwMoney,
                                        zwNote: zzwData.zwNote,
                                        wsMoney: zzwData.wsMoney,
                                        wsNote: zzwData.wsNote,
                                        zjeMoney: self.zjeMoney,
                                        xfMonery: self.xfMonery,
                                        syMonery: self.syMonery,
                                        xfTime: self.infDetails.xfTime!,
                                        cjTime: self.infDetails.creatTime!)
            
            self.infDetails = self.tiHuanInf
            
        }else{
            
            self.tiHuanInf = self.infDetails
            self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "编辑", style: .Plain, target: self, action: #selector(self.rightBtn))
            self.ModifyBool = false
            self.tableView.reloadData()
            
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



extension ELLookVC{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ECLookCell.cellFor(tableView)
        let inf = self.arrayData[indexPath.row]
        cell.timeLabel.text = inf.xfTime?.componentsSeparatedByString("^_^")[0]
        cell.moneyLabel.text = inf.xfAllMoney
        cell.lookLabel.text = "查看详情"
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return creatHeardView()
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let vc = ELCheckTheDetailsVC()
        vc.infDetails = self.arrayData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func creatHeardView() ->UIView{
        let view = UIView.init(frame: CGRectMake(0, 0, ScreenWidth, 44))
        view.backgroundColor = UIColor.whiteColor()
        let array = ["消费日期", "消费金额", "👇"]
        for temp in 0...2 {
            let label = UILabel.init(frame: CGRectMake(CGFloat(temp)*(ScreenWidth/3), 0, ScreenWidth/3, 44))
            label.textAlignment = .Center
            label.text = array[temp]
            view.addSubview(label)
        }
        let line = UILabel()
        line.backgroundColor = GrayLineColor
        view.addSubview(line)
        line.autoPinEdgeToSuperviewEdge(.Left)
        line.autoPinEdgeToSuperviewEdge(.Right)
        line.autoPinEdgeToSuperviewEdge(.Bottom)
        line.autoSetDimension(.Height, toSize: 1)
        return view
    }
    
    //删除函数
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let lef = self.arrayData[indexPath.row]
            
            if deleteInformationData(lef.creatTime!) {
                self.arrayData.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }
    
    //把delete 该成中文
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        
        return "想好哟"
    }
    
    //是否能删除
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        
        return true;
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.arrayData = queryDataInformation()
        self.tableView.reloadData()
        let ducumentPath2 = NSHomeDirectory() + "/Documents"
        print(ducumentPath2)
    }
}
