//
//  ECLookCell.swift
//  易持家
//
//  Created by 王木木 on 16/5/21.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ECLookCell: UITableViewCell {

    var timeLabel: UILabel = {
    let label = UILabel()
        label.textColor = DarkGrayTextColor
        label.font = UIFont.systemFontOfSize(16)
        label.textAlignment = .Center
    return label
    }()
    var moneyLabel: UILabel = {
        let label = UILabel()
        label.textColor = DarkGrayTextColor
        label.font = UIFont.systemFontOfSize(16)
        label.textAlignment = .Center
        return label
    }()
    var lookLabel: UILabel = {
        let label = UILabel()
        label.textColor = DarkGrayTextColor
        label.font = UIFont.systemFontOfSize(16)
        label.textAlignment = .Center
        return label
    }()
    
    static let cellId = "lookCell"
    class func cellFor(tableView: UITableView) ->ECLookCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellId) as?ECLookCell
        if cell == nil {
            cell = ECLookCell.init(style: .Default, reuseIdentifier: self.cellId)
        }
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatUI()
    }
    
    func creatUI(){
        
        for temp in 0...2 {
            let label = UILabel.init(frame: CGRectMake(CGFloat(temp)*(ScreenWidth/3), 0, ScreenWidth/3, 44))
            label.textAlignment = .Center
            self.addSubview(label)
            switch temp {
            case 0:
                self.timeLabel = label
            case 1:
                self.moneyLabel = label
            default:
                self.lookLabel = label
            }
        }
        
        self.timeLabel.autoPinEdgeToSuperviewEdge(.Bottom)
        self.timeLabel.autoPinEdgeToSuperviewEdge(.Top)
        self.timeLabel.autoPinEdgeToSuperviewEdge(.Left)
        self.timeLabel.autoSetDimension(.Width, toSize: ScreenWidth/3)
        
        self.lookLabel.autoPinEdgeToSuperviewEdge(.Bottom)
        self.lookLabel.autoPinEdgeToSuperviewEdge(.Top)
        self.lookLabel.autoPinEdgeToSuperviewEdge(.Right)
        self.lookLabel.autoSetDimension(.Width, toSize: ScreenWidth/3)
        
        self.moneyLabel.autoPinEdgeToSuperviewEdge(.Bottom)
        self.moneyLabel.autoPinEdgeToSuperviewEdge(.Top)
        self.moneyLabel.autoAlignAxisToSuperviewAxis(.Vertical)
        self.moneyLabel.autoSetDimension(.Width, toSize: ScreenWidth/3)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
