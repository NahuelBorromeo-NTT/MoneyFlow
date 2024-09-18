//
//  BarChartViewWrapper.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 18/09/24.
//

import DGCharts
import UIKit

class BarChartViewWrapper {
    private var barChartView: BarChartView
    
    init() {
        self.barChartView = BarChartView()
        setupChart()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setChartData(income: Double, expenses: Double) {
            let ingresosEntry = BarChartDataEntry(x: 0.0, y: income)
            let gastosEntry = BarChartDataEntry(x: 1.0, y: expenses)
            
            let dataSet = BarChartDataSet(entries: [ingresosEntry, gastosEntry], label: "Ingresos vs Gastos")
            
            dataSet.colors = [NSUIColor(resource: .customColorIncome), NSUIColor(resource: .customColorExpense)]
            
            let data = BarChartData(dataSet: dataSet)
            barChartView.data = data
            
            barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: ["Ingresos", "Gastos"])
            barChartView.xAxis.granularity = 1
            barChartView.xAxis.labelPosition = .bottom
            
            barChartView.animate(yAxisDuration: 2.0)
        }
    
    func getChartView() -> UIView {
        return barChartView
    }
    
    private func setupChart() {
        barChartView.noDataText = "No data available"
        barChartView.chartDescription.enabled = false
        barChartView.pinchZoomEnabled = true
        barChartView.setScaleEnabled(true)
    }
}
