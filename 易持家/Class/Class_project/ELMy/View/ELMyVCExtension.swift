//
//  ELMyVCExtension.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/12.
//  Copyright © 2016年 王木木. All rights reserved.
//

import Foundation

extension ELMyViewController {
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            modifyTheNickname()
        case 1:
            modifyTheNianI()
        case 2:
            modifyTheAge()
        default:
            changeCharacterSignature()
        }
        
    }
    
    func  modifyTheNickname(){
        
        let alertController = UIAlertController(title: "昵称",
                                                message: nil, preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (text) in
            text.placeholder = "修改昵称"
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: {
            action in
            
        })
        
        alertController.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "确定", style: .Default, handler: {
            [unowned self] action in
            
            let textF = alertController.textFields![0]
            
            if (textF.text!.isEmpty) {
                SVProgressHUD.showInfoWithStatus("请输入昵称")
                return
            }
            
            self.heardView.nameLabel.text = textF.text
            
            modifyTheUserData("nickName", modifyValue: textF.text!)
            
            self.reloadTableView()
            
            SVProgressHUD.showInfoWithStatus("昵称修改成功")
            
            })
        
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func reloadTableView() {
        
        self.manager.removeAllSections()
        
        let section = RETableViewSection.init()
        
        for dict in dataArray {
            
            let item = MyViewItem.init(title: dict["name"]!!, imageNameS: dict["image"]!!, contentNameS: dict["content"]!!, myItem: { (myItem) in })
            
            section.addItem(item)
            
        }
        
        self.manager.addSection(section)
     
        self.tableView.reloadData()
        
    }
    
    func  modifyTheNianI(){
        
        let alertController = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: {
            action in
            
        })
        
        alertController.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "男", style: .Default, handler: {
           [unowned self] action in
            modifyTheUserData("sex", modifyValue: "男")
            
            self.reloadTableView()
            
            SVProgressHUD.showInfoWithStatus("性别修改成功")
        })
        
        let nvAction = UIAlertAction(title: "女", style: .Default, handler: {
           [unowned self] action in
            
            modifyTheUserData("sex", modifyValue: "女")
            
            self.reloadTableView()
            
            SVProgressHUD.showInfoWithStatus("性别修改成功")
            
        })
        alertController.addAction(okAction)
        alertController.addAction(nvAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
        
    }
    
    func changeCharacterSignature(){
        
        let alertController = UIAlertController(title: "个性签名",
                                                message: nil, preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (text) in
            text.placeholder = "修改个性签名"
        }
        
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: {
            action in
            
        })
        
        alertController.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "确定", style: .Default, handler: {
            action in
            
        })
        
        alertController.addAction(okAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var yOffset = self.manager.tableView.contentOffset.y
        
        if yOffset < -64 {
            
            yOffset = yOffset + 64
            
            let factor = abs(yOffset) + 200
            
            let f = CGRectMake(-(ScreenWidth * factor / 200 - ScreenWidth)/2,
                               -abs(yOffset) ,
                               ScreenWidth * factor / 200,
                               factor)
            
            self.heardView.backImage.frame = f
            
        }else{
            
            var f = heardView.frame
            
            f.origin.y = 0
            
            heardView.frame = f
            
            self.heardView.backImage.frame = CGRectMake(0,
                                                        f.origin.y,
                                                        ScreenWidth,
                                                        200)
            
        }
        
    }
    
    func  modifyTheAge(){
        
        let dateP = DatePackerView.init(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight))
        
        dateP.initTimeBack {[unowned self] (timeString) in
            
            let age = timeString.componentsSeparatedByString("  ")
            
            let ageString = age[0]
            
            modifyTheUserData("age", modifyValue: ageString)
            
            self.reloadTableView()
            
        }
        
        UIApplication.sharedApplication().keyWindow?.addSubview(dateP)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if queryDataUser().passWord == "" {
            
            Appdel.callLoginWithViewConcontroller(ELLoginVC())
            
            return
        }
        
    }
    
}