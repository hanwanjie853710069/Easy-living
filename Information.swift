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
    
    func hanwanjie(
        creatTime:String,
        ids:NSNumber,
        syMoney:String,
        wsMoney:String,
        wsNote:String,
        xfAllMoney:String,
        xfTime:String,
        zjeMoney:String,
        zsMoney:String,
        zsNote:String,
        zwMoney:String,
        zwNote:String) ->AnyObject{
        
        self.ids = ids
        self.syMoney = syMoney
        self.wsMoney = wsMoney
        self.wsNote = wsNote
        self.xfAllMoney = xfAllMoney
        self.xfTime = xfTime
        self.zjeMoney = zjeMoney
        self.zsMoney = zsMoney
        self.zsNote = zsNote
        self.zwMoney = zwMoney
        self.zwNote = zwNote
        
        return self
    }
    
    
    
//    @objc func copyWithZone(zone: NSZone) -> AnyObject {
    
        
        
//        return hanwanjie(self.creatTime!, ids: self.ids!, syMoney: self.syMoney!, wsMoney: self.wsMoney!, wsNote: self.wsNote!, xfAllMoney: self.xfAllMoney!, xfTime: self.xfTime!, zjeMoney: self.zjeMoney!, zsMoney: self.zsMoney!, zsNote: self.zsNote!, zwMoney: self.zsMoney!, zwNote: self.zwNote!)
//    }
//    
//    override func copy() -> AnyObject {
//        if let asCopying = (self as AnyObject) as? NSCopying {
//            
//            return asCopying.copyWithZone(nil)
//        } else {
//            
//            assert(false, "This class doesn't implement NSCopying")
//            if let asCopying = (self as AnyObject) as? NSCopying {
//                
//                return asCopying.copyWithZone(nil)
//            }
//        }
//        
//    }
}


