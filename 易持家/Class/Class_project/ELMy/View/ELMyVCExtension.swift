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
        
        let alertController = UIAlertController(title: "数据保存成功",
                                                message: "数据保存", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (text) in
            print("aaaa")
        }
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
        //    let alt = UIAlertView.init(title: "修改昵称", message: "", delegate: nil, cancelButtonTitle: "取消", otherButtonTitles: "确定")
        //        alt.alertViewStyle = .PlainTextInput
        //        alt.show()
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let yOffset = tableView.contentOffset.y
        
        if yOffset < 64 {
            
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if queryDataUser().passWord == "" {
            
            Appdel.callLoginWithViewConcontroller(ELLoginVC())
            
            return
        }
        
    }
    
}