//
//  Weather+CoreDataProperties.swift
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

extension Weather {

    @NSManaged var baiDay: String?
    @NSManaged var city: String?
    @NSManaged var clothes: String?
    @NSManaged var maxTemperature: String?
    @NSManaged var minTemperature: String?
    @NSManaged var wanDay: String?
    @NSManaged var information: Information?

}
