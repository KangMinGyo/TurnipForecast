//
//  String+Extension.swift
//  TurnipForecast
//
//  Created by KangMingyo on 11/5/24.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
