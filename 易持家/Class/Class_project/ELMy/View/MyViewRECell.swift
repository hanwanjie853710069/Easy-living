//
//  MyViewRECell.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/3.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit
@objc(MyViewRECell)
class MyViewRECell: RETableViewCell {
    
    var heardImage: UIImageView!
    var nameLabel:  UILabel!
    var arrowImage: UIImageView!
    var contentLabel: UILabel!
    
    
    override func cellDidLoad() {
        super.cellDidLoad()
        
        self.heardImage = UIImageView()
        self.contentView.addSubview(self.heardImage)
        self.heardImage.autoPinEdgeToSuperviewEdge(.Left, withInset: 20.0)
        self.heardImage.autoAlignAxisToSuperviewAxis(.Horizontal)
        self.heardImage.autoSetDimensionsToSize(CGSizeMake(30, 30))
        
        self.arrowImage = UIImageView()
        self.contentView.addSubview(self.arrowImage)
        self.arrowImage.autoAlignAxisToSuperviewAxis(.Horizontal)
        self.arrowImage.autoPinEdgeToSuperviewEdge(.Right, withInset: 20.0)
        self.arrowImage.autoSetDimensionsToSize(CGSizeMake(8, 15))
        
        self.nameLabel = UILabel()
        self.nameLabel.font = UIFont.systemFontOfSize(16)
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.autoPinEdgeToSuperviewEdge(.Bottom)
        self.nameLabel.autoPinEdgeToSuperviewEdge(.Top)
        self.nameLabel.autoPinEdge(.Left, toEdge: .Right, ofView: self.heardImage, withOffset: 10)
        self.nameLabel.autoSetDimension(.Width, toSize: 70)
        
        self.contentLabel = UILabel()
        self.contentLabel.font = UIFont.systemFontOfSize(14)
        self.contentLabel.textColor = UIColor.darkGrayColor()
        self.contentLabel.textAlignment = .Right
        self.contentView.addSubview(self.contentLabel)
        self.contentLabel.autoPinEdgeToSuperviewEdge(.Bottom)
        self.contentLabel.autoPinEdgeToSuperviewEdge(.Top)
        self.contentLabel.autoPinEdge(.Left, toEdge: .Right, ofView: self.nameLabel, withOffset: 10)
        self.contentLabel.autoPinEdge(.Right, toEdge: .Left, ofView: self.arrowImage, withOffset: -10)
        self.contentLabel.text = "你好"
        
    }

    override func cellWillAppear() {
     
        super.cellWillAppear()
        let item = self.item as! MyViewItem
        self.heardImage.image = UIImage(named: item.imageNameS)
        self.nameLabel.text   = item.titleNameS
        self.arrowImage.image = UIImage(named: "arrow_right")
        
    }
}
