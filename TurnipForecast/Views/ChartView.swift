//
//  ChartView.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/31/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    var dailyPriceData: [DailyPriceData]
    
    var body: some View {
        Chart {
            ForEach(dailyPriceData) { data in
                BarMark(
                    xStart: .value("Price", data.minPrice),
                    xEnd: .value("Price", data.maxPrice + 1),
                    y: .value("Day", "\(data.day)")
                )
                .foregroundStyle(data.day.contains("☀️") ? Color.Chart.dayColor : Color.Chart.nightColor)
                .annotation(position: .trailing) {
                    Text(data.minPrice == data.maxPrice
                        ? "\(Int(data.minPrice))"
                        : "\(Int(data.minPrice)) - \(Int(data.maxPrice))")
                        .font(.caption)
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
    }
}


//#Preview {
//    ChartView(data: [DailyPriceData])
//}
