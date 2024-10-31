//
//  ChartView.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/31/24.
//

import SwiftUI
import Charts

struct DayData: Identifiable {
    let id = UUID() // 고유 식별자 추가
    let day: String
    let minMorning: Double
    let maxMorning: Double
    let minAfternoon: Double
    let maxAfternoon: Double
}

struct ChartView: View {
    let data: [DayData] = [
        DayData(day: "월요일", minMorning: 10, maxMorning: 20, minAfternoon: 15, maxAfternoon: 25),
        DayData(day: "화요일", minMorning: 12, maxMorning: 22, minAfternoon: 17, maxAfternoon: 27),
        DayData(day: "수요일", minMorning: 8, maxMorning: 18, minAfternoon: 14, maxAfternoon: 24),
        DayData(day: "목요일", minMorning: 11, maxMorning: 21, minAfternoon: 13, maxAfternoon: 23),
        DayData(day: "금요일", minMorning: 14, maxMorning: 19, minAfternoon: 16, maxAfternoon: 26),
        DayData(day: "토요일", minMorning: 9, maxMorning: 15, minAfternoon: 12, maxAfternoon: 22)
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
