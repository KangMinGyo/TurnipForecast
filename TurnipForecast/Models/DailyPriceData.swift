//
//  DailyPriceData.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/31/24.
//

import Foundation

struct DailyPriceData: Identifiable {
    let id = UUID()
    let day: String
    let dayMin: Double
    let dayMax: Double
    let nightMin: Double
    let nightMax: Double
    let avgPattern: Double
}

extension DailyPriceData {
    static func convertFromTurnipPriceData(turnipPriceData: TurnipPriceData) -> [DailyPriceData] {
        let weekDays = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일"]
        
        var dailyPriceDataArray: [DailyPriceData] = []
        
        for (index, data) in turnipPriceData.minMaxPattern.enumerated() {
            if index < weekDays.count {
                let dailyPriceData = DailyPriceData(
                    day: weekDays[index],
                    dayMin: Double(data[0]),
                    dayMax: Double(data[1]),
                    nightMin: Double(data[0]),
                    nightMax: Double(data[1]),
                    avgPattern: Double(turnipPriceData.avgPattern[index])
                )
                dailyPriceDataArray.append(dailyPriceData)
            }
        }
        
        return dailyPriceDataArray
    }
}
