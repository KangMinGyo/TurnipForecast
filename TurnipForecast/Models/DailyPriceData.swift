//
//  DailyPriceData.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/31/24.
//

import Foundation

struct DailyPriceData: Identifiable {
    let id = UUID() // 고유 식별자 추가
    let day: String
    let minDay: Double
    let maxDay: Double
    let minNight: Double
    let maxNight: Double
}

extension DailyPriceData {
    static func convertFromTurnipPriceData(turnipPriceData: TurnipPriceData) -> [DailyPriceData] {
        let weekDays = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일"]
        
        var dailyPriceDataArray: [DailyPriceData] = []
        
        for (index, pattern) in turnipPriceData.minMaxPattern.enumerated() {
            if index < weekDays.count {
                let dailyPriceData = DailyPriceData(
                    day: weekDays[index],
                    minDay: Double(pattern[0]),
                    maxDay: Double(pattern[1]),
                    minNight: Double(pattern[0]),
                    maxNight: Double(pattern[1])
                )
                dailyPriceDataArray.append(dailyPriceData)
            }
        }
        
        return dailyPriceDataArray
    }
}
