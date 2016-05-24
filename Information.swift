//
//  Information.swift
//  易持家
//
//  Created by 王木木 on 16/5/24.
//  Copyright © 2016年 王木木. All rights reserved.
//

import Foundation
import CoreData

@objc(Information)
class Information: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
  
    
}

extension Information{
    
    internal  func insertInterformationData(infData:Information){
        //创建Information对象
        let inf = NSEntityDescription.insertNewObjectForEntityForName("Information",
                                                                      inManagedObjectContext: managedObjectContext!) as! Information
        
        inf.creatTime  = infData.creatTime
        inf.ids        = infData.ids
        inf.syMoney    = infData.syMoney
        inf.wsMoney    = infData.wsMoney
        inf.wsNote     = infData.wsNote
        inf.xfAllMoney = infData.xfAllMoney
        inf.xfTime     = infData.xfTime
        inf.zjeMoney   = infData.zjeMoney
        inf.zsMoney    = infData.zsMoney
        inf.zsNote     = infData.zsNote
        inf.zwMoney    = infData.zwMoney
        inf.zwNote     = infData.zwNote
        //保存
        do {
            try managedObjectContext!.save()
            print("保存成功！")
            let altshow = UIAlertView.init(title: "保存本地成功", message: "", delegate: nil, cancelButtonTitle: "确定")
            altshow.show()
            
        } catch {
            fatalError("不能保存：\(error)")
            let altshow = UIAlertView.init(title: "保存本地失败", message: "\(error)", delegate: nil, cancelButtonTitle: "确定")
            altshow.show()
        }
        
    }

}
