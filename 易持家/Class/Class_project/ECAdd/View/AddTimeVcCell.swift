//
//  AddTimeVcCell.swift
//  易持家
//
//  Created by 王木木 on 16/5/20.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class AddTimeVcCell: UITableViewCell {
    
    var timer: NSTimer!
    
    lazy var timeBtn :UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.whiteColor()
        btn.setTitle(getLocalTime(), forState: .Normal)
        btn.setTitleColor(LightGrayTextColor, forState: .Normal)
        btn.titleLabel?.textAlignment = .Center
        btn.addTarget(self, action: #selector(self.addTime), forControlEvents: .TouchUpInside)
        return btn
    }()
    
    static let cellId = "timeCell"
    
    //闭包类似回调
    typealias callbackfunc=()->()
    var myFunc = callbackfunc?()
    
    class func cellFor(tableView: UITableView) ->AddTimeVcCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellId) as?AddTimeVcCell
        if cell == nil {
            cell = AddTimeVcCell.init(style: .Default, reuseIdentifier: self.cellId)
            cell?.selectionStyle = .None
        }
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatUI()
    }
    
    func creatUI(){
        
        timer =  NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.runColor), userInfo: nil, repeats: true)
        
        let nameLabel = UILabel()
        nameLabel.text = "消费日期"
        nameLabel.textColor = DarkGrayTextColor
        nameLabel.textAlignment = .Center
        self.addSubview(nameLabel)
        nameLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        nameLabel.autoPinEdgeToSuperviewEdge(.Top, withInset: 10)
        nameLabel.autoSetDimensionsToSize(CGSizeMake(100, 30))
        
        ///  消费时间
        self.addSubview(self.timeBtn)
        self.timeBtn.autoPinEdgeToSuperviewEdge(.Left)
        self.timeBtn.autoPinEdgeToSuperviewEdge(.Right)
        self.timeBtn.autoPinEdge(.Top, toEdge: .Bottom, ofView: nameLabel, withOffset: 0)
        self.timeBtn.autoSetDimension(.Height, toSize: 30)
    }
    
    func addTime(){
        UIApplication.sharedApplication().keyWindow?.endEditing(true)
        myFunc!()
    }
    
    func initBack( mathFunction:()->() ){
        myFunc = mathFunction
    }
    
    func runColor(){
        timeBtn.setTitleColor(randomColor(hue: .Random, luminosity: .Random), forState: .Normal)
//        timeBtn.backgroundColor = randomColor(hue: .Random, luminosity: .Random)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
