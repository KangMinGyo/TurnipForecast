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
    let minPrice: Double
    let maxPrice: Double
}

extension DailyPriceData {
    static func convertFromTurnipPriceData(turnipPriceData: TurnipPriceData) -> [DailyPriceData] {
        let weekDays = [
            "monday_morning", "monday_afternoon",
            "tuesday_morning", "tuesday_afternoon",
            "wednesday_morning", "wednesday_afternoon",
            "thursday_morning", "thursday_afternoon",
            "friday_morning", "friday_afternoon",
            "saturday_morning", "saturday_afternoon"
        ].map { $0.localized }
        
        var dailyPriceDataArray: [DailyPriceData] = []
        
        for (index, data) in turnipPriceData.minMaxPattern.enumerated() {
            if index < weekDays.count {
                let dailyPriceData = DailyPriceData(
                    day: weekDays[index],
                    minPrice: Double(data[0]),
                    maxPrice: Double(data[1])
                )
                dailyPriceDataArray.append(dailyPriceData)
            }
        }
        
        return dailyPriceDataArray
    }
}
