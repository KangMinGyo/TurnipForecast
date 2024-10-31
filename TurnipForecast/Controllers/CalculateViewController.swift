//
//  ViewController.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/23/24.
//

import UIKit

final class CalculateViewController: UIViewController {
    
    @IBOutlet weak var purchasePrice: UITextField!
    
    @IBOutlet var dailyTurnipPrices: [UITextField]!
    
    var turnipPrices: [String] {
        return dailyTurnipPrices.map { $0.text ?? "" }
    }
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addKeyboardDismissGesture()
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
                NotificationCenter.default.post(name: NotiName.turnipPriceData, object: nil, userInfo: ["data": priceData])
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // 특정 타겟과 액션을 설정하여 탭이 발생할 때 실행할 메서드를 지정
    private func addKeyboardDismissGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
//    //화면의 탭을 감지해서 키보드 내려가게 하기
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
}

