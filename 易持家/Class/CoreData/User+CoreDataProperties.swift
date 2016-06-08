//
//  User+CoreDataProperties.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/8.
//  Copyright © 2016年 王木木. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var heardUrl: String?
    @NSManaged var userName: String?
    @NSManaged var age: String?
    @NSManaged var backgroundUrl: String?
    @NSManaged var sex: String?
    @NSManaged var nickName: String?
    @NSManaged var passWord: String?

}
