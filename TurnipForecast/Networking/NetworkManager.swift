//
//  NetworkManager.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/29/24.
//

import Foundation

//MARK: - 네트워크에서 발생할 수 있는 에러 정의
enum NetworkError: Error {
    case networkingError
    case dataError
    case parseError
}

final class NetworkManager {
    
    typealias NetworkCompletion = (Result<[TurnipPriceData], NetworkError>) -> Void

    func fetchTurnipPriceData(prices: [Int], completion: @escaping NetworkCompletion) {
        
    }
}
