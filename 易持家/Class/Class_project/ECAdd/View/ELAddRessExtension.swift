//
//  ELAddRessExtension.swift
//  EasyLiving
//
//  Created by 王木木 on 16/5/27.
//  Copyright © 2016年 王木木. All rights reserved.
//

import Foundation

extension ELAddressVC{
    
    
    func getData(){
        
        let addressArray = queryDataAddress()
        if addressArray.count != 0 {
            self.arrayData = addressArray
            self.arrayTemp = addressArray
            self.tableView.reloadData()
            return;
        }
        
        SVProgressHUD.showWithStatus("请求数据较多请耐心等待!")
        getAllWeather { (anyobject) -> () in
            SVProgressHUD.dismiss()
            let array  = anyobject["city_info"] as?NSMutableArray
            self.arrayData = array!
            self.arrayTemp = array!
            insertAddressData(array!)
            self.tableView.reloadData()
        }
    }
    
    func initFuncBlock(tmap:(cityids:String, cityName:String)->()){
        funcBlock = tmap(cityids: cityName:)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.arrayData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellid)
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: self.cellid)
        }
        let dict = self.arrayData[indexPath.row]
        if dict.isKindOfClass(Address) {
            let addres = dict as!Address
            let prov = addres.prov
            let city = addres.city
            cell!.textLabel?.text = "\(prov!)   \(city!)"
        }else{
            let prov = dict["prov"] as! String
            let city = dict["city"] as! String
            cell!.textLabel?.text = "\(prov)   \(city)"
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let dict = self.arrayData[indexPath.row]
        if dict.isKindOfClass(Address) {
            let addres = dict as!Address
            let ids = addres.id
            let city = addres.city
            funcBlock(ids!, city!)
        }else{
            let ids = dict["id"] as! String
            let city = dict["city"] as! String
            funcBlock(ids, city)
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.searchbar
    }
    
    // 搜索代理UISearchBarDelegate方法，每次改变搜索内容时都会调用
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        // 没有搜索内容时显示全部组件
        if searchText == "" {
            self.arrayData = self.arrayTemp
        }
        else { // 匹配用户输入内容的前缀(不区分大小写)
            
            self.arrayData = []
            for dict in self.arrayTemp {
                if dict.isKindOfClass(Address) {
                    let addres = dict as!Address
                    let prov = addres.prov
                    let city = addres.city
                    if prov!.lowercaseString.hasPrefix(searchText.lowercaseString) {
                        self.arrayData.addObject(dict)
                    }
                    if city!.lowercaseString.hasPrefix(searchText.lowercaseString) {
                        self.arrayData.addObject(dict)
                    }
                }else{
                    let prov = dict["prov"] as! String
                    let city = dict["city"] as! String
                    if prov.lowercaseString.hasPrefix(searchText.lowercaseString) {
                        self.arrayData.addObject(dict)
                    }
                    if city.lowercaseString.hasPrefix(searchText.lowercaseString) {
                        self.arrayData.addObject(dict)
                    }
                }
            }
        }
        // 刷新Table View显示
        self.tableView.reloadData()
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        UIApplication.sharedApplication().keyWindow?.endEditing(true)
    }
    
}
