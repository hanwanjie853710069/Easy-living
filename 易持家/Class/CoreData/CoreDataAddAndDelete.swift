//
//  CoreDataAddAndDelete.swift
//  易持家
//
//  Created by 王木木 on 16/5/24.
//  Copyright © 2016年 王木木. All rights reserved.
//

import Foundation

/// 向数据表Information添加数据
func insertInterformationData(zsMoney: String ,
                              zsNote:  String ,
                              zwMoney: String ,
                              zwNote:  String ,
                              wsMoney: String ,
                              wsNote:  String ,
                              zjeMoney:String ,
                              xfMonery:String ,
                              syMonery:String ,
                              xfTime:  String){
    
    
    
    let inf = NSEntityDescription.insertNewObjectForEntityForName("Information",
                                                                  inManagedObjectContext: managedObjectContext) as! Information
    
    inf.creatTime  = String(NSDate().timeIntervalSince1970)
    inf.ids        = 1
    inf.syMoney    = syMonery
    inf.wsMoney    = wsMoney
    inf.wsNote     = wsNote
    inf.xfAllMoney = xfMonery
    inf.xfTime     = xfTime
    inf.zjeMoney   = zjeMoney
    inf.zsMoney    = zsMoney
    inf.zsNote     = zsNote
    inf.zwMoney    = zwMoney
    inf.zwNote     = zwNote
    //保存
    do {
        try managedObjectContext.save()
        print("保存成功！")
        let altshow = UIAlertView.init(title: "保存本地成功", message: "", delegate: nil, cancelButtonTitle: "确定")
        altshow.show()
        
    } catch {
        fatalError("不能保存：\(error)")
        let altshow = UIAlertView.init(title: "保存本地失败", message: "\(error)", delegate: nil, cancelButtonTitle: "确定")
        altshow.show()
    }
}

/// 向数据表Information查询数据
func queryDataInformation() ->[Information]{
    
    var arrayData = [Information]()
    //查询操作
    do {
        let fetchedObjects:[AnyObject]? = try managedObjectContext.executeFetchRequest(getNSFetchRequest())
        
        //遍历查询的结果
        for info:Information in fetchedObjects as! [Information]{
            arrayData.append(info)
        }
        
    }
    catch {
        fatalError("查询失败：\(error)")
        let altshow = UIAlertView.init(title: "查询失败", message: "\(error)", delegate: nil, cancelButtonTitle: "确定")
        altshow.show()
    }
    return arrayData
}

///  获取NSFetchRequest对象
func getNSFetchRequest() ->NSFetchRequest{
    //声明数据的请求
    let fetchRequest:NSFetchRequest = NSFetchRequest()
    
    //声明一个实体结构
    let entity:NSEntityDescription? = NSEntityDescription.entityForName("Information",
                                                                        inManagedObjectContext: managedObjectContext)
    //设置数据请求的实体结构
    fetchRequest.entity = entity
    return fetchRequest
}

/// 向数据表Information删除数据 yes 成功   no失败
func deleteInformationData(reattTimeIds: String) ->Bool{
    //查询操作
    do {
        let fetchedObjects:[AnyObject]? = try managedObjectContext.executeFetchRequest(getNSFetchRequest())
        
        //遍历查询的结果
        for info:Information in fetchedObjects as! [Information]{
            if info.creatTime == reattTimeIds {
                let altshow = UIAlertView.init(title: "删除成功", message: "", delegate: nil, cancelButtonTitle: "确定")
                altshow.show()
                //删除对象
                managedObjectContext.deleteObject(info)
                return true
            }
        }
        
    }
    catch {
        fatalError("删除失败：\(error)")
        let altshow = UIAlertView.init(title: "删除失败", message: "\(error)", delegate: nil, cancelButtonTitle: "确定")
        altshow.show()
    }
    
    do{
        //重新保存-更新到数据库
        try managedObjectContext.save()
    }catch {
        fatalError("重新保存-更新到数据库：\(error)")
    }
    
    return false
}

/// 向数据表Information修改数据
func modifyTheInterformationData(zsMoney: String ,
                                 zsNote:  String ,
                                 zwMoney: String ,
                                 zwNote:  String ,
                                 wsMoney: String ,
                                 wsNote:  String ,
                                 zjeMoney:String ,
                                 xfMonery:String ,
                                 syMonery:String ,
                                 xfTime:  String ,
                                 cjTime:  String ) ->Bool{
    //查询操作
    do {
        let fetchedObjects:[AnyObject]? = try managedObjectContext.executeFetchRequest(getNSFetchRequest())
        
        //遍历查询的结果
        for inf:Information in fetchedObjects as! [Information]{
            if inf.creatTime == cjTime {
                inf.syMoney    = syMonery
                inf.wsMoney    = wsMoney
                inf.wsNote     = wsNote
                inf.xfAllMoney = xfMonery
                inf.zjeMoney   = zjeMoney
                inf.zsMoney    = zsMoney
                inf.zsNote     = zsNote
                inf.zwMoney    = zwMoney
                inf.zwNote     = zwNote
            }
        }
        
    }
    catch {
        fatalError("修改失败：\(error)")
    }
    
    do{
        //重新保存-更新到数据库
        try managedObjectContext.save()
        let altshow = UIAlertView.init(title: "修改成功", message: "", delegate: nil, cancelButtonTitle: "确定")
        altshow.show()
        return true
    }catch {
        fatalError("重新保存-更新到数据库：\(error)")
        let altshow = UIAlertView.init(title: "修改失败", message: "\(error)", delegate: nil, cancelButtonTitle: "确定")
        altshow.show()
    }
    
    return false
}



///  向Weather表插入数据
func insertWeatherData(baiDay        : String ,
                       city          : String ,
                       clothes       : String ,
                       maxTemperature: String ,
                       minTemperature: String ,
                       wanDay        : String){
    
    let weather = NSEntityDescription.insertNewObjectForEntityForName("Weather",
                                                                      inManagedObjectContext: managedObjectContext) as! Weather
    weather.baiDay = baiDay
    weather.city = city
    weather.clothes = clothes
    weather.maxTemperature = maxTemperature
    weather.minTemperature = minTemperature
    weather.wanDay = wanDay
    let panduan = try? managedObjectContext.save()
    print(panduan)
}

func queryDataWeather() ->String{

    //声明数据的请求
    let fetchRequest:NSFetchRequest = NSFetchRequest()
    //声明一个实体结构
    let entity:NSEntityDescription? = NSEntityDescription.entityForName("Weather",
                                                                        inManagedObjectContext: managedObjectContext)
    //设置数据请求的实体结构
    fetchRequest.entity = entity
    
    let fetchedObjects:[AnyObject]? = try? managedObjectContext.executeFetchRequest(fetchRequest)
    //遍历查询的结果
    for inf:Weather in fetchedObjects as! [Weather]{
        let weather = inf.city! + " 白天:" + inf.baiDay! + "  夜晚:" + inf.wanDay! + "  最高温度:" + inf.maxTemperature! + "  最低温度:" + inf.minTemperature! + "  穿衣推荐:" + inf.clothes!
        
        return weather
        print(inf)
    }
return "没有获取到天气数据"
}
