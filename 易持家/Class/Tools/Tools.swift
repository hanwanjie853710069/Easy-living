//
//  Tools.swift
//  易持家
//
//  Created by 王木木 on 16/5/20.
//  Copyright © 2016年 王木木. All rights reserved.
//

import Foundation

/// 总密码
let passWordZ = "王木木"

///屏幕高度
let ScreenHeight = UIScreen.mainScreen().bounds.size.height

///屏幕宽度
let ScreenWidth = UIScreen.mainScreen().bounds.size.width

///系统版本号
let SystemVersion = Float(UIDevice.currentDevice().systemVersion)

/// 主题色
let MainColore = UIColor.init(forHexString: "f1f3f7")

///文字主色调
let MainTextColor = UIColor.init(forHexString: "#333333")

///深灰色文字色调
let DarkGrayTextColor = UIColor.init(red: 0.44, green: 0.44, blue: 0.44, alpha: 1)

///浅灰色文字色调
let LightGrayTextColor = UIColor.init(red: 0.84, green: 0.84, blue: 0.84, alpha: 1)

/// 浅灰色背景色调
let LightGrayBgColor = UIColor.init(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)

///浅灰色线
let GrayLineColor = UIColor.init(forHexString: "#C8C7CC")

///透明色
let ClearColor = UIColor.clearColor()

///  通知ID
let theTotalAmountIds = "NotificationIdentifier"

///  获取appdelegate
let Appdel = UIApplication.sharedApplication().delegate as! AppDelegate;

///  获取管理的数据上下文 对象 managedObjectContext
let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

//获取天气地址
let weather = "https://api.heweather.com/x3/weather?cityid=CN101010100&key=457b9c98179048ebb19bc0e147cf67e6"

///  定义UIImage对象
func UIImageName(name:String) ->UIImage{ return UIImage(named: name)! }

///  获取当去本地系统时间
func getLocalTime() -> String {
    
    let date = NSDate()
    let timeFormatter = NSDateFormatter()
    timeFormatter.dateFormat = "yyy-MM-dd  '^_^'  HH:mm:ss"
    let strNowTime = timeFormatter.stringFromDate(date) as String
    let timeArray = strNowTime.componentsSeparatedByString(".")
    return timeArray[0]
}

///  支付键盘限制条件
func payTheKeyboardConstraints(TextField:UITextField, string: String) ->Bool{
    //判断点击的是不是  删除键
    if string == "" {
        return true
    }
    //输入第一个字符为。情况下
    if TextField.text?.characters.count  == 0{
        if string == "." {
            TextField.text = "0."
            return false
        }
    }
    //输入第一个字符为0情况下
    if  TextField.text?.characters.count  == 0 {
        if string == "0" {
            TextField.text = "0."
            return false
        }
    }
    //第一个字符为0的情况下
    if  TextField.text?.characters.count  == 1 {
        if TextField.text == "0" {
            if string  != "." {
                return false
            }
        }
    }
    //判断当输入第二个.的情况下
    if string == "." {
        if ((TextField.text?.containsString(".")) == true) {
            return false
        }
    }
    //小数点后面只能保留两位
    if ((TextField.text?.containsString(".")) == true) {
        let array = TextField.text?.componentsSeparatedByString(".")
        if array![1].characters.count == 1 {
            return false
        }
    }
    return true
}

///  支付键盘限制条件
func  paytextFieldDidEndEditingTextField(textField:UITextField){
    var range  = NSRange()
    range.length = 1
    range.location = (textField.text?.characters.count)!-1
    let stringOne = (textField.text! as NSString).substringWithRange(range)
    if stringOne == "." {
        let  array = textField.text?.componentsSeparatedByString(".")
        textField.text = array![0]
    }
}

///  支付键盘限制条件
func paytextFieldDidBeginEditingTextField(textField :UITextField){
    if textField.text?.characters.count == 1 {
        var range = NSRange()
        range.length = 1
        range.location = 0
        let string = (textField.text! as NSString).substringWithRange(range)
        if string == "0" {
            textField.text = "0."
        }
    }
}

///  存储选中的天气信息到本地  以备下次进入应用使用  NSUserDefaults
func saveWeatherInformation(city:String, cityIds:String){
    //设置存储信息
    NSUserDefaults.standardUserDefaults().setObject(city, forKey: "city")
    NSUserDefaults.standardUserDefaults().setObject(cityIds, forKey: "cityids")
    //设置同步
    NSUserDefaults.standardUserDefaults().synchronize()
}

///  读取本地存储的天气ids
let cityids = NSUserDefaults.standardUserDefaults().valueForKey("cityids") as! String!

///  读取本地存储的天气name
let city = NSUserDefaults.standardUserDefaults().valueForKey("city") as! String!

//通过颜色来生成一个纯色图片
func getColorImageWithColor(color:UIColor) ->(UIImage){
    
    let rect = CGRectMake(0, 0, ScreenWidth, ScreenHeight)
    
    UIGraphicsBeginImageContext(rect.size);
    
    let context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, rect);
    
    let img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
    
}

//创建文件夹
func createAFolder(){
    
    if !NSFileManager.defaultManager().fileExistsAtPath(getheardImageFilePath()) {
        
        _ = try?  NSFileManager.defaultManager().createDirectoryAtPath(getheardImageFilePath(), withIntermediateDirectories: false, attributes: nil)
    }
    
}

///  获取头像文件夹路径
func getheardImageFilePath() ->String{
    
    let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
    
    let documentsDirectory = paths.first
    
//    let last = paths.last
    
//    let pathsc = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
    
//    let cachesF = pathsc.first
    
//    let cachesL = pathsc.last
    
//    print(NSTemporaryDirectory())
    
    let path = documentsDirectory!.stringByAppendingString("/HeardImageFile")
    
    print(path)
    
    return path
}

///  保存头像图片到本地
func saveHeardImageWithImage(image:UIImage){
    //  图片压缩data
    let dataImage = UIImageJPEGRepresentation(image, 1.0)
    
    let path = getHeardPath()
    
    dataImage!.writeToFile(path, atomically: true)
    
}

///  获取头像图片

func getHeardImage() -> UIImage {
    
    let path = getHeardPath()
    
    if !NSFileManager.defaultManager().fileExistsAtPath(path) {
        
        return UIImage()
        
    }
    
    return UIImage.init(contentsOfFile: path)!
}

///  获取头像图片路径
func getHeardPath() -> String{
    
    return getheardImageFilePath() + "/" + queryDataUser().userName! + ".jpg"
    
}

///  获取背景图路径
func getBackPath() -> String{
    
    return getheardImageFilePath() + "/" + queryDataUser().userName! + "back.jpg"
    
}

///  保存背景图片到本地
func saveBackImageWithImage(image:UIImage){
    //  图片压缩data
    let dataImage = UIImageJPEGRepresentation(image, 1.0)
    
    let path = getBackPath()
    
    dataImage!.writeToFile(path, atomically: true)
    
}

///  获取背景图片

func getBackImage() -> UIImage {
    
    let path = getBackPath()
    
    if !NSFileManager.defaultManager().fileExistsAtPath(path) {
        
        return UIImage()
        
    }
    
    return UIImage.init(contentsOfFile: path)!
}
