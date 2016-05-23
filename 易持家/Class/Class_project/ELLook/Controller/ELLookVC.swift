//
//  ELLookVC.swift
//  易持家
//
//  Created by 王木木 on 16/5/20.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELLookVC: CMBaseViewController,
    UITableViewDelegate,
    UITableViewDataSource{
    
    lazy var tableView : UITableView = {
        let tabV = UITableView.init(frame: self.view.bounds)
        tabV.delegate = self
        tabV.dataSource = self
        tabV.tableFooterView = UIView()
        tabV.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20)
        return tabV
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.tableView)
    }
}

extension ELLookVC{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ECLookCell.cellFor(tableView)
        cell.timeLabel.text = "2010.01.01"
        cell.moneyLabel.text = "100"
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
        self.navigationController?.pushViewController(ELCheckTheDetailsVC(), animated: true)
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

}
