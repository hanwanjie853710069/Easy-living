//
//  DatePackerView.swift
//  易持家
//
//  Created by 王木木 on 16/5/20.
//  Copyright © 2016年 王木木. All rights reserved.
//
/**
 mark--  使用方法
 ///  创建选择时间器
 func creatDatePickView(timeBtn: UIButton){
 let dateP = DatePackerView.init(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight))
 //回调打印选中的日期
 dateP.initTimeBack { (timeString) in
 print("选择的日期是：\(timeString)")
 }
 //展示在当前Window
 UIApplication.sharedApplication().keyWindow?.addSubview(dateP)
 }
 
 */

import UIKit

class DatePackerView: UIView {
    
    lazy var datePickView:UIDatePicker = {
        
        let dateP = UIDatePicker.init(frame: CGRectMake(ScreenWidth/2, 50+64, 2, 2))
        dateP.backgroundColor = LightGrayBgColor
        //设置样式，当前设为同时显示日期和时间
        dateP.datePickerMode = UIDatePickerMode.Date
        // 设置日期范围（超过日期范围，会回滚到最近的有效日期）
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        var minDate = dateFormatter.dateFromString("2016-5-20")
        dateP.maximumDate = NSDate()
        dateP.minimumDate = minDate
        // 设置默认时间
        dateP.date = NSDate()
        // 响应事件（只要滚轮变化就会触发）
        dateP.addTarget(self, action:#selector(self.datePickerValueChange), forControlEvents: UIControlEvents.ValueChanged)
        return dateP
        
    }()
    
    typealias callbackSetTime=(timeString:String)->()
    var myFunc = callbackSetTime?()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        creatUI()
    }
    
    func creatUI(){
        self.backgroundColor = UIColor.init(colorLiteralRed: 153/255.0, green: 153/255.0, blue: 153/255.0, alpha: 0.2)
        self.addSubview(self.datePickView)
        showDatePicker()
    }
    
    func showDatePicker(){
        UIView.animateWithDuration(0.3) {
            self.datePickView.frame = CGRectMake(0, ScreenHeight-400, ScreenWidth, 200)
        }
    }
    
    /// 响应 datePicker 事件
    func datePickerValueChange(sender: UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  '^_^'  HH:mm:ss"
        let sourceTimeZone = NSTimeZone.systemTimeZone()
        dateFormatter.timeZone = sourceTimeZone
        let nnnn = dateFormatter.stringFromDate(sender.date)
        myFunc!(timeString: nnnn)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        UIView.animateWithDuration(0.3, animations: {
            self.datePickView.frame = CGRectMake(ScreenWidth/2, 50+64, 2, 2)
        }) { (boll) in
            self.removeFromSuperview()
        }
        
    }
    
    func initTimeBack( callbackSetTime:(timeString:String)->() ){
        myFunc = callbackSetTime
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
