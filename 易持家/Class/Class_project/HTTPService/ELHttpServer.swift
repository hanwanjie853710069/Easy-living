//
//  ELHttpServer.swift
//  EasyLiving
//
//  Created by 王木木 on 16/5/26.
//  Copyright © 2016年 王木木. All rights reserved.
//

import Foundation


let manager: AFHTTPSessionManager! = {
    let mana = AFHTTPSessionManager()
    return mana
}()

///  获取天气ids
func getAllWeather( mathFunction:(AnyObject)->()){
    
    let url = "https://api.heweather.com/x3/citylist?search=allchina&key=457b9c98179048ebb19bc0e147cf67e6"
    
    manager.GET(url, parameters: nil, progress: { (progress:NSProgress) in
        
        }, success: { (sessionDataTask:NSURLSessionDataTask, anyobject:AnyObject?) in
            mathFunction(anyobject!)
    }) { (session:NSURLSessionDataTask?, error: NSError) in
        SVProgressHUD.showInfoWithStatus(String(error))
    }
}

//根据cityids获取天气情况
///  获取天气信息
func getTheWeatherInformation(cityid:String, mathFunction:(AnyObject)->())->(){
    let weather = "https://api.heweather.com/x3/weather?cityid="+cityid+"&key=457b9c98179048ebb19bc0e147cf67e6"
    
    manager.GET(weather, parameters: nil, progress: { (progress:NSProgress) in
        }, success: { (sessionDataTask:NSURLSessionDataTask, anyobject:AnyObject?) in
            mathFunction(anyobject!)
            //            let json : AnyObject! = try? NSJSONSerialization
            //                .JSONObjectWithData(anyobject! as! NSData, options:NSJSONReadingOptions.AllowFragments)
            let array = anyobject!["HeWeather data service 3.0"] as? NSArray
            let dict = array![0]
            //城市名称
            let city = dict["basic"]!!["city"] as! String
            //白天天气情况
            let baiDaya = dict["daily_forecast"] as! NSArray
            let baiDayarray = baiDaya[0]
            let baiDay = baiDayarray["cond"]!!["txt_d"] as! String
            //晚上天气情况
            let wanDay = baiDayarray["cond"]!!["txt_n"] as! String
            //最高温度
            let max = baiDayarray["tmp"]!!["max"] as! String
            //最低温度
            let min = baiDayarray["tmp"]!!["min"] as! String
            //穿衣推荐
            var clothes = ""
            if dict["suggestion"]! != nil{
                clothes = dict["suggestion"]!!["drsg"]!!["txt"] as! String
            }
            
            //存储数据到本地
            insertWeatherData(baiDay,
                city: city,
                clothes: clothes,
                maxTemperature: max,
                minTemperature: min,
                wanDay: wanDay)
            
    }) { (session:NSURLSessionDataTask?, error: NSError) in
        SVProgressHUD.showInfoWithStatus(String(error))
    }
}