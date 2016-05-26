//
//  ELAddressVC.swift
//  EasyLiving
//
//  Created by 王木木 on 16/5/26.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELAddressVC:
    CMBaseViewController ,
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
    
    let cellid = "cellid"
    var arrayData :NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "地点"
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.tableView)
        getData()
    }
    
    func getData(){
        SVProgressHUD.showWithMaskType(.Clear)
        getAllWeather { (anyobject) -> () in
            SVProgressHUD.dismiss()
            let array  = anyobject["city_info"] as?NSArray
            self.arrayData = array
            self.tableView.reloadData()
            
        }
    }
}

extension ELAddressVC{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.arrayData != nil {
            return self.arrayData!.count
        }else{
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellid)
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: self.cellid)
        }
        let dict = self.arrayData![indexPath.row]
        let prov = dict["prov"] as! String
        let city = dict["city"] as! String
        cell!.textLabel?.text = "\(prov)   \(city)"
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func blockWerath(cityids:String) -> () {
        
    }
}
