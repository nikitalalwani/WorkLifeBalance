//
//  BarChartCell.swift
//  WorkLifeBalance
//
//  Created by nikita lalwani on 4/16/19.
//  Copyright © 2019 nikita lalwani. All rights reserved.
//

import UIKit
import Charts

class BarChartCell: UITableViewCell {

    var properties = [Int]()
    var values = [Double]()
    var dataEntries: [BarChartDataEntry] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func createBarChart () {
       
        let barChartView = BarChartView(frame: CGRect(x: 0, y: 10, width: self.frame.width, height: self.frame.height - 50))
        var dataEntries: [BarChartDataEntry] = []
        
        for (index, value) in values.enumerated() {
            let yValue = value
            let entry = BarChartDataEntry(x: Double(index), y: yValue)
            dataEntries.append(entry)
        }
        
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Current Week")
                var dataSets = [IChartDataSet]()
                dataSets.append(chartDataSet)
                let chartData = BarChartData(dataSets: dataSets)
        barChartView.data = chartData
        var valuesObject = [String]()
        for property in properties {
            valuesObject.append(Utilities.helper.dayOfWeek(weekDay: property))
        }
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: valuesObject)
        // Show the limit lines behind each plot
        barChartView.xAxis.drawLimitLinesBehindDataEnabled = true
        
        // Make sure that only 1 x-label per index is shown
        barChartView.xAxis.granularityEnabled = true
        barChartView.xAxis.granularity = 1
        chartDataSet.colors = ChartColorTemplates.colorful()
        self.addSubview(barChartView)
    }
}

