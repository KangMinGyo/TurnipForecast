//
//  ChartView.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/31/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    var data: [DailyPriceData]

    var body: some View {
            Chart {
                ForEach(data) { item in
                    BarMark(
                        x: .value("Temperature", item.minDay),
                        y: .value("Day", "\(item.day) 낮")
                    )
                    .foregroundStyle(.white)
                    
                    BarMark(
                        x: .value("Temperature", item.maxDay),
                        y: .value("Day", "\(item.day) 낮")
                    )
                    .foregroundStyle(.orange.opacity(0.5))
                    
                    BarMark(
                        x: .value("Temperature", item.minNight),
                        y: .value("Day", "\(item.day) 밤")
                    )
                    .foregroundStyle(.white)
                    
                    BarMark(
                        x: .value("Temperature", item.maxNight),
                        y: .value("Day", "\(item.day) 밤")
                    )
                    .foregroundStyle(.blue.opacity(0.5))
                }
            }
            .padding()
    }
}


//#Preview {
//    ChartView(data: [DailyPriceData])
//}
