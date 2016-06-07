//
//  ELMyHtmlCell.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/7.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

@objc(ELMyHtmlCell)
class ELMyHtmlCell: RETableViewCell {

    lazy var textView :DTAttributedTextView = {
        
        let text = DTAttributedTextView.init(frame: CGRectMake(0.0,
            0.0,
            self.frame.size.width,
            self.frame.size.height))
        
        text.autoresizingMask = .FlexibleWidth
        
        return text
        
    }()
    
    override func cellDidLoad() {
        super.cellDidLoad()
        let aaa = try? String.init(contentsOfFile: "/Users/wangmumu/Desktop/README.txt", encoding: NSUTF8StringEncoding)
        
        let data = aaa!.dataUsingEncoding(NSUTF8StringEncoding)
        
        
        let attributedString = NSAttributedString.init(HTMLData: data, documentAttributes: nil)
        
        self.textView.attributedString = attributedString
        
        self.addSubview(self.textView)
        
        self.textView.autoPinEdgeToSuperviewEdge(.Left)
        self.textView.autoPinEdgeToSuperviewEdge(.Right)
        self.textView.autoPinEdgeToSuperviewEdge(.Top)
        self.textView.autoPinEdgeToSuperviewEdge(.Bottom)
    }
    
    
    override func cellWillAppear() {
        
        super.cellWillAppear()
       let item = self.item! as! ELMySectonItem
        print(item.hTmlString)
    }
    
    override class func heightWithItem(item: RETableViewItem, tableViewManager: RETableViewManager) -> CGFloat {
        return 2000
        
    }

}
