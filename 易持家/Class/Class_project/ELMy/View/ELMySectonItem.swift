//
//  ELMySectonItem.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/7.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit
@objc(ELMySectonItem)
class ELMySectonItem: RETableViewItem {

    var hTmlString: String!
    
    init(title: String, htmlString:String) {
        
        super.init(title: nil)
        
        self.hTmlString = htmlString
    
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
