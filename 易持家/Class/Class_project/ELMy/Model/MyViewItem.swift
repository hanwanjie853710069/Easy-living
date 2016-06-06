//
//  MyViewItem.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/3.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

@objc(MyViewItem)
class MyViewItem: RETableViewItem {

    var titleNameS: String!
    
    var imageNameS: String!
    
    init(title: String, imageNameS:String, myItem:MyViewItem ->()) {
        
        super.init(title: nil)
        
        self.imageNameS = imageNameS
        
        self.titleNameS = title
    }
    
    override init() {
        
        super.init()
    }
    
    override init!(title: String!) {
        super.init(title: title)
    }
    
    override init!(title: String!, accessoryType: UITableViewCellAccessoryType, selectionHandler: ((RETableViewItem!) -> Void)!) {
        super.init(title: title, accessoryType: accessoryType, selectionHandler: selectionHandler)
    }
    
    override init!(title: String!, accessoryType: UITableViewCellAccessoryType, selectionHandler: ((RETableViewItem!) -> Void)!, accessoryButtonTapHandler: ((RETableViewItem!) -> Void)!) {
        super.init(title: title, accessoryType: accessoryType, selectionHandler: selectionHandler, accessoryButtonTapHandler: accessoryButtonTapHandler)
    }

    
}
