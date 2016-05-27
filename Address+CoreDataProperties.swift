//
//  Address+CoreDataProperties.swift
//  EasyLiving
//
//  Created by 王木木 on 16/5/27.
//  Copyright © 2016年 王木木. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Address {

    @NSManaged var city: String?
    @NSManaged var cnty: String?
    @NSManaged var id: String?
    @NSManaged var lat: String?
    @NSManaged var lon: String?
    @NSManaged var prov: String?

}
