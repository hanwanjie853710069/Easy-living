//
//  ELCheckView.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/8.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELCheckView: UIView {

    var psWdTextFlied: UITextField!
    var confirmBtn: UIButton!
    var cancelBtn: UIButton!
    var forgotPasswordBtn: UIButton!
    
    //闭包类似回调
    typealias callbackConfirm=(tagString:String)->()
    var myFuncC = callbackConfirm?()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(colorLiteralRed: 100.0/255.0, green: 100.0/255.0, blue: 100.0/255.0, alpha: 0.8)
        
        psWdTextFlied = UITextField()
        self.addSubview(psWdTextFlied)
        psWdTextFlied.placeholder = "请输入密码"
        psWdTextFlied.backgroundColor = LightGrayTextColor
        psWdTextFlied.layer.cornerRadius = 5
        psWdTextFlied.layer.masksToBounds = true
        psWdTextFlied.autoPinEdgeToSuperviewEdge(.Top, withInset: 140)
        psWdTextFlied.autoPinEdgeToSuperviewEdge(.Left, withInset: 20)
        psWdTextFlied.autoPinEdgeToSuperviewEdge(.Right, withInset: 20)
        psWdTextFlied.autoSetDimension(.Height, toSize: 40)
        psWdTextFlied.becomeFirstResponder()
        
        confirmBtn = UIButton()
        self.addSubview(confirmBtn)
        confirmBtn.setTitle("确认", forState: .Normal)
        confirmBtn.tag = 100
        confirmBtn.addTarget(self, action: #selector(self.forgotPasswordTouch(_:)), forControlEvents: .TouchUpInside)
        confirmBtn.setBackgroundImage(getColorImageWithColor(UIColor.init(red: 0.32,
            green: 0.67,
            blue: 0.90,
            alpha: 1.00)),
                                       forState: .Normal)
        confirmBtn.layer.cornerRadius = 5
        confirmBtn.layer.masksToBounds = true
        confirmBtn.autoPinEdge(.Top, toEdge: .Bottom, ofView: psWdTextFlied, withOffset: 30)
        confirmBtn.autoPinEdgeToSuperviewEdge(.Left, withInset: 50)
        confirmBtn.autoPinEdgeToSuperviewEdge(.Right, withInset: 50)
        confirmBtn.autoSetDimension(.Height, toSize: 40)
        
        cancelBtn = UIButton()
        cancelBtn.setTitle("取消", forState: .Normal)
        cancelBtn.setTitleColor(UIColor.init(red: 0.32, green: 0.67,blue: 0.90 ,alpha: 1.00), forState: .Normal)
        cancelBtn.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        cancelBtn.addTarget(self, action: #selector(self.regidteredBtn), forControlEvents: .TouchUpInside)
        self.addSubview(cancelBtn)
        cancelBtn.autoPinEdge(.Top, toEdge: .Bottom, ofView: confirmBtn, withOffset: 20)
        cancelBtn.autoPinEdgeToSuperviewEdge(.Left, withInset: 20)
        cancelBtn.autoSetDimensionsToSize(CGSizeMake(60, 30))
        cancelBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        
        forgotPasswordBtn = UIButton()
        forgotPasswordBtn.setTitle("忘记密码", forState: .Normal)
        forgotPasswordBtn.setTitleColor(UIColor.init(red: 0.32, green: 0.67,blue: 0.90 ,alpha: 1.00), forState: .Normal)
        forgotPasswordBtn.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        self.addSubview(forgotPasswordBtn)
        forgotPasswordBtn.autoPinEdge(.Top, toEdge: .Bottom, ofView: confirmBtn, withOffset: 20)
        forgotPasswordBtn.autoPinEdgeToSuperviewEdge(.Right, withInset: 20)
        forgotPasswordBtn.autoSetDimensionsToSize(CGSizeMake(60, 30))
        forgotPasswordBtn.titleLabel?.font = UIFont.systemFontOfSize(14)
        forgotPasswordBtn.addTarget(self, action: #selector(self.forgotPasswordTouch(_:)), forControlEvents: .TouchUpInside)
        forgotPasswordBtn.tag = 101
        self.alpha = 0.0
        UIView.animateWithDuration(0.3) {
            self.alpha = 1.0
        }
    }
    
    func regidteredBtn(){
        
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 0.0
        }) { (boll) in
            self.removeFromSuperview()
        }
    }
    
    func forgotPasswordTouch(btn:UIButton){
        
        ///  100确定  101忘记密码
        if btn.tag == 100 {
            myFuncC!(tagString: "100")
        }else{
            myFuncC!(tagString: "101")
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        psWdTextFlied.resignFirstResponder()
        UIView.animateWithDuration(0.3, animations: {
            self.alpha = 0.0
        }) { (boll) in
            self.removeFromSuperview()
        }
        
    }
    
    func initBack( mathFunction:(tagString:String)->() ){
        myFuncC = mathFunction
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
