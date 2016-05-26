//
//  Information+CoreDataProperties.swift
//  EasyLiving
//
//  Created by 王木木 on 16/5/26.
//  Copyright © 2016年 王木木. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Information {

    @NSManaged var creatTime: String?
    @NSManaged var ids: NSNumber?
    @NSManaged var syMoney: String?
    @NSManaged var wsMoney: String?
    @NSManaged var wsNote: String?
    @NSManaged var xfAllMoney: String?
    @NSManaged var xfTime: String?
    @NSManaged var zjeMoney: String?
    @NSManaged var zsMoney: String?
    @NSManaged var zsNote: String?
    @NSManaged var zwMoney: String?
    @NSManaged var zwNote: String?
    @NSManaged var weather: String?
    @NSManaged var weathers: NSSet?

}
