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
                    xEnd: .value("Price", data.dayMax),
                    y: .value("Day", "\(data.day) 낮")
                )
                .foregroundStyle(.orange)
                .annotation(position: .trailing) {
                    Text("\(Int(data.dayMin)) - \(Int(data.dayMax))")
                        .font(.caption)
                        .foregroundColor(.orange)
                }
                
                BarMark(
                    xStart: .value("Price", data.nightMin),
                    xEnd: .value("Price", data.nightMax),
                    y: .value("Day", "\(data.day) 밤")
                )
                .foregroundStyle(.indigo)
                .annotation(position: .trailing) {
                    Text("\(Int(data.nightMin)) - \(Int(data.nightMax))")
                        .font(.caption)
                        .foregroundColor(.indigo)
                }
            }
        }
        .padding()
    }
}


//#Preview {
//    ChartView(data: [DailyPriceData])
//}
