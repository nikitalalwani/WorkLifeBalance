//
//  PieChartCell.swift
//  WorkLifeBalance
//
//  Created by nikita lalwani on 4/16/19.
//  Copyright © 2019 nikita lalwani. All rights reserved.
//

import UIKit
import Charts

class PieChartCell: UITableViewCell {

    var properties = [String]()
    var values = [Double]()
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func createPieChart()  {
        
        let chart = PieChartView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 50))
        
        var entries = [PieChartDataEntry]()
        for (index, value) in values.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = value/24 * 100
            entry.label = properties[index]
            entries.append( entry)
        }
        
        
        
        let set = PieChartDataSet( entries: entries, label: nil)
        
        let colors = [UIColor.lightpurpleColor,UIColor.darkPurpleColor,UIColor(red:218/255 ,green:165/255 ,blue:32/255,alpha:1.0 ),UIColor.blue,UIColor.red]
        
        set.colors = colors
        let data = PieChartData(dataSet: set)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 1
        formatter.multiplier = 1.0
        data.setValueFormatter(DefaultValueFormatter(formatter:formatter))
        
        chart.data = data
        chart.noDataText = "No data available"
        chart.isUserInteractionEnabled = true
        chart.backgroundColor = .clear
        chart.maxAngle = 100
        let d = Description()
        d.text = ""
        chart.chartDescription = d
        chart.holeColor = UIColor(red:255,green:255,blue:255,alpha:0.5)
        chart.centerText = "Today"
        self.addSubview(chart)
    }

}
