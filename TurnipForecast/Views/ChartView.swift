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
        DailyPriceData(day: "월요일", minDay: 10, maxDay: 20, minNight: 15, maxNight: 25),
        DailyPriceData(day: "화요일", minDay: 12, maxDay: 22, minNight: 17, maxNight: 27),
        DailyPriceData(day: "수요일", minDay: 8, maxDay: 18, minNight: 14, maxNight: 24),
        DailyPriceData(day: "목요일", minDay: 11, maxDay: 21, minNight: 13, maxNight: 23),
        DailyPriceData(day: "금요일", minDay: 14, maxDay: 19, minNight: 16, maxNight: 26),
        DailyPriceData(day: "토요일", minDay: 9, maxDay: 15, minNight: 12, maxNight: 22)
    ]

    var body: some View {
        Chart(data) { day in
            BarMark(x: .value("Day", day.day),
                    yStart: .value("Min Morning", day.minDay),
                    yEnd: .value("Max Morning", day.maxDay))
            BarMark(x: .value("Day", day.day),
                    yStart: .value("Min Afternoon", day.minNight),
                    yEnd: .value("Max Afternoon", day.maxNight))
        }
        .padding()
    }
}


#Preview {
    ChartView()
}
