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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tap Gesture Recognizer 추가
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        purchasePrice.text = ""
        
        for textField in dailyTurnipPrices {
            textField.text = ""
        }
    }
    
    
    @IBAction func fetchTurnipPriceButtonTapped(_ sender: UIButton) {
        
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
}

