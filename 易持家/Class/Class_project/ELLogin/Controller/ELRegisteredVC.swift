//
//  ELRegisteredVC.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/8.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELRegisteredVC: CMBaseViewController {
    var nextView: ELloginView!
    var nameView: ELloginView!
    var psWdView: ELloginView!
    var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "注册"
        creatTextFiled()
        
    }
    func creatTextFiled(){
        
        nextView  = ELloginView.init(frame: CGRectMake(0, 0, 0, 0),
                                     placeholder: "请输入账户名",
                                     imageName: "zhanghao")
        
        self.view.addSubview(nextView)
        nextView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        nextView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
        nextView.autoPinEdgeToSuperviewEdge(.Top, withInset: 114)
        nextView.autoSetDimension(.Height, toSize: 40)
        
        
        
        nameView  = ELloginView.init(frame: CGRectMake(0, 0, 0, 0),
                                     placeholder: "请输入密码",
                                     imageName: "passWord")
        self.view.addSubview(nameView)
        nameView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        nameView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
        nameView.autoPinEdge(.Top, toEdge: .Bottom, ofView: nextView, withOffset: 20)
        nameView.autoSetDimension(.Height, toSize: 40)
        
        
        psWdView  = ELloginView.init(frame: CGRectMake(0, 0, 0, 0),
                                     placeholder: "请再次输入密码",
                                     imageName: "passWord")
        self.view.addSubview(psWdView)
        psWdView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        psWdView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
        psWdView.autoPinEdge(.Top, toEdge: .Bottom, ofView: nameView, withOffset: 20)
        psWdView.autoSetDimension(.Height, toSize: 40)
        
        loginBtn = UIButton()
        loginBtn.layer.cornerRadius = 6
        loginBtn.layer.masksToBounds = true
        loginBtn.setTitle("注册", forState: .Normal)
        self.view.addSubview(loginBtn)
        loginBtn.setBackgroundImage(getColorImageWithColor(UIColor.init(red: 0.32,
            green: 0.67,
            blue: 0.90,
            alpha: 1.00)),
                                    forState: .Normal)
        loginBtn.autoPinEdgeToSuperviewEdge(.Left, withInset: 30)
        loginBtn.autoPinEdgeToSuperviewEdge(.Right, withInset: 30)
        loginBtn.autoPinEdge(.Top, toEdge: .Bottom, ofView: psWdView, withOffset: 40)
        loginBtn.autoSetDimension(.Height, toSize: 40)
        loginBtn.addTarget(self, action: #selector(self.registeredTouch), forControlEvents: .TouchUpInside)
        
    }
    
    func registeredTouch(){
        
        if (nextView.textFiled.text?.characters.count == 0) {
            SVProgressHUD.showInfoWithStatus("请输入用户名")
            return
        }
        
        if (nameView.textFiled.text?.characters.count == 0) {
            SVProgressHUD.showInfoWithStatus("请输入密码")
            return
        }
        if (psWdView.textFiled.text?.characters.count == 0) {
            SVProgressHUD.showInfoWithStatus("请输入确认密码")
            return
        }
        if nameView.textFiled.text != psWdView.textFiled.text{
            SVProgressHUD.showInfoWithStatus("两次密码输入不一致")
            return
        }
        
        modifyTheUserData("age", modifyValue: "0")
        modifyTheUserData("nickName", modifyValue: nextView.textFiled.text!)
        modifyTheUserData("passWord", modifyValue: psWdView.textFiled.text!)
        modifyTheUserData("sex", modifyValue: "男")
        modifyTheUserData("userName", modifyValue: nextView.textFiled.text!)
        
        SVProgressHUD.showInfoWithStatus("注册成功")
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
