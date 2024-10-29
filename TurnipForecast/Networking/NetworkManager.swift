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
    
    typealias NetworkCompletion = (Result<TurnipPriceData, NetworkError>) -> Void

    func fetchTurnipPriceData(purchasePrice: String, dailyPrices: [String], completion: @escaping NetworkCompletion) {
        let formattedPrices = dailyPrices.filter { $0 != "" }.map { $0 }.joined(separator: "-")
        let urlString = "\(TurnipApi.requestUrl)\(TurnipApi.mediaParam)\(purchasePrice)-\(formattedPrices)"
        print(urlString)
        
        performRequest(with: urlString) { result in
            completion(result)
        }
    }
    
    // Request 함수 (비동기적 실행)
    private func performRequest(with urlString: String, completion: @escaping NetworkCompletion) {

        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                completion(.failure(.networkingError))
                return
            }
            
            guard let safeData = data else {
                completion(.failure(.dataError))
                return
            }
            
            if let priceData = self.parseJSON(safeData) {
                print("Parse 실행")
                completion(.success(priceData))
            } else {
                print("Parse 실패")
                completion(.failure(.parseError))
            }
        }
        task.resume()
    }
    
    // 데이터 함수 (동기적 실행)
    private func parseJSON(_ priceData: Data) -> TurnipPriceData? {
        //print(#function)
        do {
            let priceData = try JSONDecoder().decode(TurnipPriceData.self, from: priceData)
            return priceData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
