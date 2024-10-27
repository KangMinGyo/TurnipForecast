//
//  TurnipPriceData.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/27/24.
//

import Foundation

struct TurnipPriceData: Codable {
    let filters: [Int]
    let minWeekValue: Int
    let minMaxPattern: [[Int]]
    let avgPattern: [Int]
}
