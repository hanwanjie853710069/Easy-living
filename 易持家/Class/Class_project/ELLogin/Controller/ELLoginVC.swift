//
//  ELLoginVC.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/8.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELLoginVC: CMBaseViewController {
    
    var nameView: ELloginView!
    var psWdView: ELloginView!
    var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        creatUI()
        
    }
    
    func creatUI(){
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "关闭", style: .Done, target: self, action: #selector(self.outInTouch(_:)))
        
        self.title = "登录"
        
        creatTextFiled()
        creatTheRegistrationAndForgotPassword()
        
    }
    
    func creatTextFiled(){
        
        nameView  = ELloginView.init(frame: CGRectMake(0, 0, 0, 0),
                                     placeholder: "请输入账号",
                                     imageName: "zhanghao")
        self.view.addSubview(nameView)
        nameView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        nameView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
        nameView.autoPinEdgeToSuperviewEdge(.Top, withInset: 134)
        nameView.autoSetDimension(.Height, toSize: 40)
        
        
        psWdView  = ELloginView.init(frame: CGRectMake(0, 0, 0, 0),
                                     placeholder: "请输入密码",
                                     imageName: "passWord")
        self.view.addSubview(psWdView)
        psWdView.autoPinEdgeToSuperviewEdge(.Left, withInset: 10)
        psWdView.autoPinEdgeToSuperviewEdge(.Right, withInset: 10)
        psWdView.autoPinEdge(.Top, toEdge: .Bottom, ofView: nameView, withOffset: 20)
        psWdView.autoSetDimension(.Height, toSize: 40)
        
        loginBtn = UIButton()
        loginBtn.layer.cornerRadius = 6
        loginBtn.layer.masksToBounds = true
        loginBtn.setTitle("登录", forState: .Normal)
        loginBtn.addTarget(self, action: #selector(self.loginBtnTouch), forControlEvents: .TouchUpInside)
        self.view.addSubview(loginBtn)
        loginBtn.setBackgroundImage(getColorImageWithColor(UIColor.init(red: 0.32,
            green: 0.67,
            blue: 0.90,
            alpha: 1.00)),
                                    forState: .Normal)
        loginBtn.autoPinEdgeToSuperviewEdge(.Left, withInset: 30)
        loginBtn.autoPinEdgeToSuperviewEdge(.Right, withInset: 30)
        loginBtn.autoPinEdge(.Top, toEdge: .Bottom, ofView: psWdView, withOffset: 30)
        loginBtn.autoSetDimension(.Height, toSize: 40)
        
    }
    
    func creatTheRegistrationAndForgotPassword(){
        
        let registered = UIButton()
        registered.setTitle("注册账号", forState: .Normal)
        registered.setTitleColor(UIColor.init(red: 0.32, green: 0.67,blue: 0.90 ,alpha: 1.00), forState: .Normal)
        registered.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        registered.addTarget(self, action: #selector(self.regidteredBtn), forControlEvents: .TouchUpInside)
        self.view.addSubview(registered)
        registered.autoPinEdge(.Top, toEdge: .Bottom, ofView: loginBtn, withOffset: 20)
        registered.autoPinEdgeToSuperviewEdge(.Left, withInset: 20)
        registered.autoSetDimensionsToSize(CGSizeMake(60, 30))
        registered.titleLabel?.font = UIFont.systemFontOfSize(14)
        
        let forgotPassword = UIButton()
        forgotPassword.setTitle("忘记密码", forState: .Normal)
        forgotPassword.setTitleColor(UIColor.init(red: 0.32, green: 0.67,blue: 0.90 ,alpha: 1.00), forState: .Normal)
        forgotPassword.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        self.view.addSubview(forgotPassword)
        forgotPassword.autoPinEdge(.Top, toEdge: .Bottom, ofView: loginBtn, withOffset: 20)
        forgotPassword.autoPinEdgeToSuperviewEdge(.Right, withInset: 20)
        forgotPassword.autoSetDimensionsToSize(CGSizeMake(60, 30))
        forgotPassword.titleLabel?.font = UIFont.systemFontOfSize(14)
        forgotPassword.addTarget(self, action: #selector(self.forgotPassWordBtn), forControlEvents: .TouchUpInside)
    }
    func forgotPassWordBtn(){
        
        self.navigationController?.pushViewController(ELResetPasswordVC(), animated: true)
    }
    
    func regidteredBtn(){
        
        self.navigationController?.pushViewController(ELRegisteredVC(), animated: true)
        
    }
    
    func loginBtnTouch(){
        if nameView.textFiled.text == "" {
            SVProgressHUD.showInfoWithStatus("请输入账号")
            return
        }
        if psWdView.textFiled.text == "" {
            SVProgressHUD.showInfoWithStatus("请输入密码")
            return
        }
        if queryDataUser().passWord != psWdView.textFiled.text {
            SVProgressHUD.showInfoWithStatus("密码错误")
            return
        }
        self.navigationController
    
    }
    
    func outInTouch(barButtonItem: UIBarButtonItem){
    
        self.navigationController?.dismissViewControllerAnimated(true, completion: { 
            self.navigationController?.tabBarController?.selectedIndex = 2
        })
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
        
    }
    
}
