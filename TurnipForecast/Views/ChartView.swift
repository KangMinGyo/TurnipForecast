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
                    xStart: .value("Price", data.dayMin),
                    xEnd: .value("Price", data.dayMax + 1),
                    y: .value("Day", "\(data.day) 낮")
                )
                .foregroundStyle(Color.Chart.dayColor)
                .annotation(position: .trailing) {
                    Text("\(Int(data.dayMin)) - \(Int(data.dayMax))")
                        .font(.caption)
                        .foregroundColor(.black)
                }
                
                BarMark(
                    xStart: .value("Price", data.nightMin),
                    xEnd: .value("Price", data.nightMax + 1),
                    y: .value("Day", "\(data.day) 밤")
                )
                .foregroundStyle(Color.Chart.nightColor)
                .annotation(position: .trailing) {
                    Text("\(Int(data.nightMin)) - \(Int(data.nightMax))")
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
