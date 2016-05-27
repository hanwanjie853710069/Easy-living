//
//  ELASingleSetOfLinearGraphVC.swift
//  EasyLiving
//
//  Created by 王木木 on 16/5/27.
//  Copyright © 2016年 王木木. All rights reserved.
//

import UIKit

class ELASingleSetOfLinearGraphVC:
    CMBaseViewController ,
    ZFGenericChartDataSource,
    ZFLineChartDelegate{
    
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
        let lineChart = ZFLineChart.init(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight-64))
        lineChart.dataSource = self;
        lineChart.delegate = self;
        lineChart.topic = "消费图";
        lineChart.unit = "元";
        lineChart.isResetYLineMinValue = true;
        self.view.addSubview(lineChart)
        lineChart.strokePath()
    }
    
    ///  mark - ZFGenericChartDataSource
    func valueArrayInGenericChart(chart: ZFGenericChart!) -> [AnyObject]! {
        return xfMonary
    }
    
    func nameArrayInGenericChart(chart: ZFGenericChart!) -> [AnyObject]! {
        return timeData
    }
    
    func colorArrayInGenericChart(chart: ZFGenericChart!) -> [AnyObject]! {
        return [UIColor.greenColor()]
    }
    
    func yLineMaxValueInGenericChart(chart: ZFGenericChart!) -> CGFloat {
        return CGFloat(100)
    }
    
    func yLineSectionCountInGenericChart(chart: ZFGenericChart!) -> Int {
        return 20
    }
    
    func yLineMinValueInGenericChart(chart: ZFGenericChart!) -> CGFloat {
        return CGFloat(-100)
    }
    
    ///  mark - ZFBarChartDelegate
    
    func lineChart(lineChart: ZFLineChart!, didSelectCircleAtLineIndex lineIndex: Int, circleIndex: Int) {
        print(lineChart)
    }
    func lineChart(lineChart: ZFLineChart!, didSelectPopoverLabelAtLineIndex lineIndex: Int, circleIndex: Int) {
        let vc = ELCheckTheDetailsVC()
        vc.infDetails = information[circleIndex]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}





