//
//  ELMyCellHeardView.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/3.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELMyCellHeardView: UIView {

    var headImage: UIButton!
    
    var nameLabel: UILabel!
    
    var backImage: UIImageView!
    
    
    init(frame: CGRect, nameLabel: String, heardImageUrl: String, backImage: String) {
        
        super.init(frame: frame)
        
        creatUI(nameLabel,heardImageUrl: heardImageUrl ,backImage: backImage)
        
    }
    
    func creatUI(nameLabel: String, heardImageUrl: String, backImage:String){
    
        self.backImage = UIImageView()
        self.backImage.image = UIImage(named: backImage)
        
        self.headImage = UIButton()
        self.headImage.layer.cornerRadius = (self.frame.size.height - 130)/2
        self.headImage.layer.masksToBounds = true
        self.headImage.layer.borderColor = UIColor.whiteColor().CGColor
        self.headImage.layer.borderWidth = 2
        self.headImage.setImage(UIImage(named: heardImageUrl),
                                forState: .Normal)
        
        
        
        self.nameLabel = UILabel()
        self.nameLabel.text = nameLabel
        self.nameLabel.textAlignment = .Center
        self.nameLabel.textColor = UIColor.whiteColor()
        
        self.addSubview(self.backImage)
        self.addSubview(self.headImage)
        self.addSubview(self.nameLabel)
        
        self.backImage.autoPinEdgesToSuperviewEdges()
        
        self.headImage.autoAlignAxisToSuperviewAxis(.Vertical)
        self.headImage.autoPinEdgeToSuperviewEdge(.Top, withInset: 50)
        self.headImage.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 80)
        self.headImage.autoSetDimension(.Width,
                                        toSize: self.frame.size.height - 130)
        
        self.nameLabel.autoPinEdgeToSuperviewEdge(.Left)
        self.nameLabel.autoPinEdgeToSuperviewEdge(.Right)
        self.nameLabel.autoSetDimension(.Height, toSize: 30)
        self.nameLabel.autoPinEdge(.Top,
                                   toEdge: .Bottom,
                                   ofView: self.headImage,
                                   withOffset: 20)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }

}
