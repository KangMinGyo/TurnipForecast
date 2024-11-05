//
//  String+Extension.swift
//  TurnipForecast
//
//  Created by KangMingyo on 11/5/24.
//

import Foundation

extension String {
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
