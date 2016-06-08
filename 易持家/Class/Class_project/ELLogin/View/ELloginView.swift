//
//  ELloginView.swift
//  EasyLiving
//
//  Created by 王木木 on 16/6/8.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELloginView: UIView {
    
    var textFiled: UITextField!
    
    init(frame: CGRect, placeholder:String, imageName: String) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.textFiled = UITextField.init()
//        self.textFiled.layer.borderColor = UIColor.darkGrayColor().CGColor
//        self.textFiled.layer.borderWidth = 1.0
        self.textFiled.placeholder = placeholder
        self.textFiled.leftViewMode = .Always
        let image = UIImageView.init(image: UIImage(named: imageName))
        image.frame = CGRectMake(0, 0, 30, 30)
        self.textFiled.leftView = image
        self.textFiled.backgroundColor = UIColor.whiteColor()
        self.addSubview(self.textFiled)
        
        self.textFiled.autoPinEdgeToSuperviewEdge(.Left, withInset: 1)
        self.textFiled.autoPinEdgeToSuperviewEdge(.Right, withInset: 1)
        self.textFiled.autoPinEdgeToSuperviewEdge(.Top)
        self.textFiled.autoPinEdgeToSuperviewEdge(.Bottom, withInset: 1)
        
        
    }
    
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
    
        let width = CGRectGetWidth(rect)
        
        let height = CGRectGetHeight(rect)
        
//        let bh = height - 5.0
        
//        let p1 = CGPoint(x: 0, y: bh)
        
        let p2 = CGPoint(x: 0, y: height)
        
        let p3 = CGPoint(x: width, y: height)
        
//        let p4 = CGPoint(x: width, y: bh)
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetStrokeColorWithColor(context,UIColor.init(red: 0.32,
            green: 0.67,
            blue: 0.90,
            alpha: 1.00).CGColor)
        
        CGContextSetLineWidth(context, 1.0)
//
//        CGContextMoveToPoint(context, p1.x, p1.y)
        
        CGContextMoveToPoint(context, p2.x, p2.y)
        
        CGContextAddLineToPoint(context, p3.x, p3.y)
        
//        CGContextAddLineToPoint(context, p4.x, p4.y)
        
        CGContextStrokePath(context)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
