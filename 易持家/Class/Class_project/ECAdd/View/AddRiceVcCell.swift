//
//  AddRiceVcCell.swift
//  易持家
//
//  Created by 王木木 on 16/5/20.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit
//代理通知主界面数据改变
protocol dataChangeDelegate : NSObjectProtocol {
    func changeDataFunc(textFiled:UITextField)
}

class AddRiceVcCell: UITableViewCell ,UITextFieldDelegate{
    
    var delegate :dataChangeDelegate!
    let nameLabel = UILabel()
    let amountTextFile = UITextField()
    let noteTextView = UITextView()
    var timer: NSTimer!
    
    static let cellId = "riceCell"
    
    class func cellFor(tableView: UITableView) ->AddRiceVcCell{
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellId) as?AddRiceVcCell
        if cell == nil {
            cell = AddRiceVcCell.init(style: .Default, reuseIdentifier: self.cellId)
            cell?.selectionStyle = .None
        }
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        creatUI()
    }
    
    func creatUI(){
        
        timer =  NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.runColorW), userInfo: nil, repeats: true)
        
        self.addSubview(nameLabel)
        nameLabel.textAlignment = .Center
        nameLabel.font = UIFont.boldSystemFontOfSize(40)
        nameLabel.autoPinEdgeToSuperviewEdge(.Left)
        nameLabel.autoPinEdgeToSuperviewEdge(.Top)
        nameLabel.autoPinEdgeToSuperviewEdge(.Bottom)
        nameLabel.autoSetDimension(.Width, toSize: 50)
        nameLabel.backgroundColor = MainColore
        
       let amountLabel = UILabel()
       self.addSubview(amountLabel)
        amountLabel.text = "消费金额"
        amountLabel.textColor = DarkGrayTextColor
        amountLabel.font = UIFont.systemFontOfSize(16)
        amountLabel.autoPinEdge(.Left, toEdge: .Right, ofView: nameLabel, withOffset: 10)
        amountLabel.autoPinEdgeToSuperviewEdge(.Top)
        amountLabel.autoSetDimension(.Height, toSize: 40)
        amountLabel.autoSetDimension(.Width, toSize: 70)
        
        self.addSubview(amountTextFile)
        amountTextFile.keyboardType = .DecimalPad
        amountTextFile.placeholder = "Enter the amount"
        amountTextFile.delegate = self
        amountTextFile.backgroundColor = LightGrayBgColor
        amountTextFile.font = UIFont.systemFontOfSize(16)
        amountTextFile.textAlignment = .Center
        amountTextFile.autoPinEdge(.Left, toEdge: .Right, ofView: amountLabel, withOffset: 10)
        amountTextFile.autoPinEdgeToSuperviewEdge(.Top)
        amountTextFile.autoSetDimension(.Height, toSize: 40)
        amountTextFile.autoPinEdgeToSuperviewEdge(.Right)
        
        let lineLabel = UILabel()
        lineLabel.backgroundColor = GrayLineColor
        self.addSubview(lineLabel)
        lineLabel.autoPinEdge(.Left, toEdge: .Right, ofView: nameLabel, withOffset: 0)
        lineLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: amountTextFile, withOffset: 0)
        lineLabel.autoPinEdgeToSuperviewEdge(.Right)
        lineLabel.autoSetDimension(.Height, toSize: 1)
        
        let moodLabel = UILabel()
        self.addSubview(moodLabel)
        moodLabel.text = "心情备注"
        moodLabel.textColor = DarkGrayTextColor
        moodLabel.font = UIFont.systemFontOfSize(16)
        moodLabel.textAlignment = .Center
        moodLabel.autoPinEdge(.Left, toEdge: .Right, ofView: nameLabel, withOffset: 10)
        moodLabel.autoPinEdgeToSuperviewEdge(.Bottom)
        moodLabel.autoPinEdge(.Top, toEdge: .Bottom, ofView: amountLabel, withOffset: 0)
        moodLabel.autoSetDimension(.Width, toSize: 70)
        
        self.addSubview(noteTextView)
        noteTextView.font = UIFont.systemFontOfSize(14)
        noteTextView.backgroundColor = LightGrayBgColor
        noteTextView.text = "Say something!"
        noteTextView.autoPinEdge(.Left, toEdge: .Right, ofView: moodLabel, withOffset: 10)
        noteTextView.autoPinEdge(.Top, toEdge: .Bottom, ofView: lineLabel, withOffset: 0)
        noteTextView.autoPinEdgeToSuperviewEdge(.Bottom)
        noteTextView.autoPinEdgeToSuperviewEdge(.Right)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return payTheKeyboardConstraints(textField, string: string)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        paytextFieldDidEndEditingTextField(textField)
        self.delegate?.changeDataFunc(textField)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        paytextFieldDidBeginEditingTextField(textField)
    }
    
    func runColorW(){
    nameLabel.textColor = randomColor(hue: .Random, luminosity: .Random)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIApplication.sharedApplication().keyWindow?.endEditing(true)
    }
}
