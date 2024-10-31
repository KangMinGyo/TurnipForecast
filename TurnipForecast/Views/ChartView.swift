//
//  ChartView.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/31/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    let data: [DailyPriceData] = [
        DailyPriceData(day: "월요일", minMorning: 10, maxMorning: 20, minAfternoon: 15, maxAfternoon: 25),
        DailyPriceData(day: "화요일", minMorning: 12, maxMorning: 22, minAfternoon: 17, maxAfternoon: 27),
        DailyPriceData(day: "수요일", minMorning: 8, maxMorning: 18, minAfternoon: 14, maxAfternoon: 24),
        DailyPriceData(day: "목요일", minMorning: 11, maxMorning: 21, minAfternoon: 13, maxAfternoon: 23),
        DailyPriceData(day: "금요일", minMorning: 14, maxMorning: 19, minAfternoon: 16, maxAfternoon: 26),
        DailyPriceData(day: "토요일", minMorning: 9, maxMorning: 15, minAfternoon: 12, maxAfternoon: 22)
    ]

    var body: some View {
        Chart(data) { day in
            BarMark(x: .value("Day", day.day),
                     yStart: .value("Min Morning", day.minMorning),
                     yEnd: .value("Max Morning", day.maxMorning))
            BarMark(x: .value("Day", day.day),
                     yStart: .value("Min Afternoon", day.minAfternoon),
                     yEnd: .value("Max Afternoon", day.maxAfternoon))
        }
        .padding()
    }
}


#Preview {
    ChartView()
}
