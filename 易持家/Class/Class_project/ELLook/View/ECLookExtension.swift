//
//  ECLookExtension.swift
//  易持家
//
//  Created by 王木木 on 16/5/24.
//  Copyright © 2016年 王木木. All rights reserved.
//

import Foundation


extension ELCheckTheDetailsVC{
    
    func creatUI(){
        self.view.addSubview(self.tableView)
        self.tableView.autoPinEdgeToSuperviewEdge(.Left)
        self.tableView.autoPinEdgeToSuperviewEdge(.Right)
        self.tableView.autoPinEdgeToSuperviewEdge(.Top)
        self.tableView.autoPinEdgeToSuperviewEdge(.Bottom)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "编辑", style: .Plain, target: self, action: #selector(self.rightBtn))
    }
    
    func rightBtn(btnItem: UIBarButtonItem){
        if  btnItem.title == "编辑" {
           self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "完成", style: .Plain, target: self, action: #selector(self.rightBtn))
        }else{
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "编辑", style: .Plain, target: self, action: #selector(self.rightBtn))
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 4 {
            return 60
        }
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell =  AddTimeVcCell.cellFor(tableView)
            cell.userInteractionEnabled = false
            cell.initBack { (selectIndex) in}
            cell.timeBtn.setTitle(infDetails.xfTime, forState: .Normal)
            return cell
        }
        if indexPath.row == 4 {
            let cell =  AddToCalculateVcCell.cellFor(tableView)
            cell.userInteractionEnabled = false
            cell.moneyAllLabel.text = infDetails.xfAllMoney
            cell.moneyTextFlied.text = infDetails.zjeMoney
            cell.moneyRemainingLabel.text = infDetails.syMoney
            self.AddToCalculateCell = cell
            return cell
        }
        let cell =  AddRiceVcCell.cellFor(tableView)
        cell.nameLabel.text = dataArray[indexPath.row - 1]
        cell.amountTextFile.tag = 100 + indexPath.row
        cell.userInteractionEnabled = false
        switch indexPath.row {
        case 1:
            cell.amountTextFile.text = infDetails.zsMoney
            cell.noteTextView.text = infDetails.zsNote
        case 2:
            cell.amountTextFile.text = infDetails.zwMoney
            cell.noteTextView.text = infDetails.zwNote
        case 3:
            cell.amountTextFile.text = infDetails.wsMoney
            cell.noteTextView.text = infDetails.wsNote
        default:
            print("")
        }
        
        return cell
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if cell.respondsToSelector(Selector("setSeparatorInset:")) {
            cell.separatorInset = UIEdgeInsetsZero
        }
        if cell.respondsToSelector(Selector("setLayoutMargins:")) {
            cell.layoutMargins = UIEdgeInsetsZero
        }
    }
    
    override func viewDidLayoutSubviews() {
        if self.tableView.respondsToSelector(Selector("setSeparatorInset:")) {
            self.tableView.separatorInset = UIEdgeInsetsZero
        }
        if self.tableView.respondsToSelector(Selector("setLayoutMargins:")) {
            self.tableView.layoutMargins = UIEdgeInsetsZero
        }
        
    }
    
}



extension ELLookVC{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ECLookCell.cellFor(tableView)
        let inf = self.arrayData[indexPath.row]
        cell.timeLabel.text = inf.xfTime?.componentsSeparatedByString("^_^")[0]
        cell.moneyLabel.text = inf.xfAllMoney
        cell.lookLabel.text = "查看详情"
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return creatHeardView()
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let vc = ELCheckTheDetailsVC()
        vc.infDetails = self.arrayData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func creatHeardView() ->UIView{
        let view = UIView.init(frame: CGRectMake(0, 0, ScreenWidth, 44))
        view.backgroundColor = UIColor.whiteColor()
        let array = ["消费日期", "消费金额", "👇"]
        for temp in 0...2 {
            let label = UILabel.init(frame: CGRectMake(CGFloat(temp)*(ScreenWidth/3), 0, ScreenWidth/3, 44))
            label.textAlignment = .Center
            label.text = array[temp]
            view.addSubview(label)
        }
        let line = UILabel()
        line.backgroundColor = GrayLineColor
        view.addSubview(line)
        line.autoPinEdgeToSuperviewEdge(.Left)
        line.autoPinEdgeToSuperviewEdge(.Right)
        line.autoPinEdgeToSuperviewEdge(.Bottom)
        line.autoSetDimension(.Height, toSize: 1)
        return view
    }
    
    //删除函数
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let lef = self.arrayData[indexPath.row]
            
            if deleteInformationData(lef.creatTime!) {
                self.arrayData.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }
    
    //把delete 该成中文
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        
        return "想好哟"
    }
    
    //是否能删除
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        
        return true;
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.arrayData = queryDataInformation()
        self.tableView.reloadData()
        let ducumentPath2 = NSHomeDirectory() + "/Documents"
        print(ducumentPath2)
    }
}
