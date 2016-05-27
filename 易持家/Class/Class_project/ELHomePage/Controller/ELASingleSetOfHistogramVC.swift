//
//  ELASingleSetOfHistogramVC.swift
//  EasyLiving
//
//  Created by 王木木 on 16/5/27.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELASingleSetOfHistogramVC:
    CMBaseViewController ,
    ZFGenericChartDataSource,
    ZFBarChartDelegate{
    
    var timeData = [String]()
    
    var xfMonary = [String]()
    
    var information = [Information]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = .None;
        getData()
    }
    
    func getData(){
        let arrayData = queryDataInformation()
        information = arrayData
        for temp:Information in arrayData {
            let timeS = temp.xfTime
            let timeGet = timeS?.componentsSeparatedByString("^_^")
            timeData.append(timeGet![0])
            xfMonary.append(temp.xfAllMoney!)
        }
        if timeData.count == 0 {
            SVProgressHUD.showInfoWithStatus("未查询到数据")
            return
        }
        
        creatZFBarChart()
    }
    
    func creatZFBarChart(){
        let barChart = ZFBarChart.init(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight-64))
        barChart.dataSource = self;
        barChart.delegate = self;
        barChart.topic = "消费图";
        barChart.unit = "元";
        self.view.addSubview(barChart)
        barChart.strokePath()
        
    }
    
    ///  mark - ZFGenericChartDataSource
    func valueArrayInGenericChart(chart: ZFGenericChart!) -> [AnyObject]! {
        return xfMonary
    }
    func nameArrayInGenericChart(chart: ZFGenericChart!) -> [AnyObject]! {
        return timeData
    }
    func yLineMaxValueInGenericChart(chart: ZFGenericChart!) -> CGFloat {
        return CGFloat(50)
    }
    func yLineSectionCountInGenericChart(chart: ZFGenericChart!) -> Int {
        return 20
    }
    
    ///  mark - ZFBarChartDelegate
    
    func barChart(barChart: ZFBarChart!, didSelectBarAtGroupIndex groupIndex: Int, barIndex: Int) {
        let vc = ELCheckTheDetailsVC()
        vc.infDetails = information[barIndex]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func barChart(barChart: ZFBarChart!, didSelectPopoverLabelAtGroupIndex groupIndex: Int, labelIndex: Int) {
        let vc = ELCheckTheDetailsVC()
        vc.infDetails = information[labelIndex]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


