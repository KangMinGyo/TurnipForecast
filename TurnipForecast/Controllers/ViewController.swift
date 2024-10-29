//
//  ViewController.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/23/24.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var purchasePrice: UITextField!
    
    @IBOutlet var dailyTurnipPrices: [UITextField]!
    
    var turnipPrices: [String] {
        return dailyTurnipPrices.map { $0.text ?? "" }
    }
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tap Gesture 추가
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        print(#function)
        purchasePrice.text = ""
        
        for textField in dailyTurnipPrices {
            textField.text = ""
        }
    }
    
    
    @IBAction func fetchTurnipPriceButtonTapped(_ sender: UIButton) {
        print(#function)
        
        networkManager.fetchTurnipPriceData(purchasePrice: purchasePrice.text!, dailyPrices: turnipPrices) { data in
            switch data {
            case.success(let priceData):
                print(priceData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
}

