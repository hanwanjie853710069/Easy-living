//
//  AddToCalculateVcCell.swift
//  易持家
//
//  Created by 王木木 on 16/5/21.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class AddToCalculateVcCell:
    UITableViewCell ,
    UITextFieldDelegate{
    
        /// 全部金额
    let moneyTextFlied: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter the amount"
        view.font = UIFont.systemFontOfSize(16)
        view.keyboardType = .DecimalPad
        view.textAlignment = .Center
        return view
    }()
        /// 剩余金额
    let moneyRemainingLabel: UILabel = {
        let label = UILabel()
        label.textColor = MainTextColor
        label.text = "0.0"
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(16)
        return label
    }()
        /// 消费金额
    let moneyAllLabel: UILabel = {
        let label = UILabel()
        label.textColor = MainTextColor
        label.text = "0.0"
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(16)
        return label
    }()
    
    static let cellId = "toCell"
    
    class func cellFor(tableView: UITableView) ->AddToCalculateVcCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellId) as?AddToCalculateVcCell
        if cell == nil {
            cell = AddToCalculateVcCell.init(style: .Default, reuseIdentifier: self.cellId)
            cell?.selectionStyle = .None
        }
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatUI()
    }
    
    func creatUI(){
        
        moneyTextFlied.delegate = self
        
        var labelTH :UILabel?
        let contentArray = ["总金额", "消费总计", "剩余金额"]
        
        for temp in 0...2{
            let namelabel = UILabel()
            self.addSubview(namelabel)
            if temp == 0 {
                namelabel.autoPinEdgeToSuperviewEdge(.Left)
                namelabel.autoPinEdgeToSuperviewEdge(.Top)
                namelabel.autoSetDimensionsToSize(CGSizeMake(ScreenWidth/3, 30))
            }else{
                namelabel.autoPinEdge(.Left, toEdge: .Right, ofView: labelTH!, withOffset: 0)
                namelabel.autoPinEdgeToSuperviewEdge(.Top)
                namelabel.autoSetDimensionsToSize(CGSizeMake(ScreenWidth/3, 30))
            }
            
            let lineH = UILabel()
            self.addSubview(lineH)
            lineH.backgroundColor = GrayLineColor
            lineH.autoPinEdge(.Left, toEdge: .Right, ofView: namelabel, withOffset: 0)
            lineH.autoPinEdge(.Top, toEdge: .Top, ofView: namelabel, withOffset: 5)
            lineH.autoPinEdge(.Bottom, toEdge: .Bottom, ofView: namelabel, withOffset: 25)
            lineH.autoSetDimension(.Width, toSize: 1)
            
            namelabel.textAlignment = .Center
            namelabel.text = contentArray[temp]
            labelTH = namelabel
        }
        let lineV = UILabel()
        lineV.backgroundColor = GrayLineColor
        self.addSubview(lineV)
        lineV.autoPinEdge(.Top, toEdge: .Bottom, ofView: labelTH!, withOffset: 0)
        lineV.autoPinEdgeToSuperviewEdge(.Left)
        lineV.autoPinEdgeToSuperviewEdge(.Right)
        lineV.autoSetDimension(.Height, toSize: 1)
        
        //The total amount
        self.addSubview(moneyTextFlied)
        self.addSubview(moneyAllLabel)
        self.addSubview(moneyRemainingLabel)
        let labelArray = [moneyTextFlied,moneyAllLabel,moneyRemainingLabel]
        for temp in 0...labelArray.count-1 {
            let label = labelArray[temp]
            label.autoPinEdgeToSuperviewEdge(.Bottom)
            label.autoPinEdge(.Top, toEdge: .Bottom, ofView: lineV, withOffset: 0)
            label.autoSetDimension(.Width, toSize: ScreenWidth/3)
            switch temp {
            case 0:
                label.autoPinEdgeToSuperviewEdge(.Left)
            case 1:
                label.autoPinEdge(.Left, toEdge: .Right, ofView: labelArray[0], withOffset: 0)
            case 2:
                label.autoPinEdge(.Left, toEdge: .Right, ofView: labelArray[1], withOffset: 0)
            default:
                print("")
            }
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return payTheKeyboardConstraints(textField, string: string)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        paytextFieldDidEndEditingTextField(textField)
        ///  发送通知  接受在主页面
        NSNotificationCenter.defaultCenter().postNotificationName(theTotalAmountIds, object: textField)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        paytextFieldDidBeginEditingTextField(textField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
