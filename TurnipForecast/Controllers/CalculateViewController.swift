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
    @IBOutlet weak var nextButton: UIButton!
    
    var turnipPrices: [String] {
        return dailyTurnipPrices.map { $0.text ?? "" }
    }
    
    let networkManager = NetworkManager()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkTextFieldContent()
        loadDataToTextFields()
        addKeyboardDismissGesture()
        
        purchasePrice.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
    }
    
    // MARK: - TextField Validation
    
    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        checkTextFieldContent()
    }
    
    private func checkTextFieldContent() {
        if let purchasePrice = purchasePrice.text, !purchasePrice.isEmpty {
            nextButton.isEnabled = true
            nextButton.backgroundColor = UIColor(named: "BackgroundColor")
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = .systemGray3
        }
    }
    
    // MARK: - Data Loading
    
    private func loadDataToTextFields() {
        guard let purchasePrice = UserDefaults.standard.string(forKey: UserDefaultsKeys.purchasePrice) else { return }
        guard let savedTurnipPrices = UserDefaults.standard.stringArray(forKey: UserDefaultsKeys.turnipPrices) else { return }
        
        self.purchasePrice.text = purchasePrice
        for (textField, price) in zip(dailyTurnipPrices, savedTurnipPrices) {
            textField.text = price
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func resetButtonTapped(_ sender: UIButton) {
        print(#function)
        purchasePrice.text = ""
        
        for textField in dailyTurnipPrices {
            textField.text = ""
        }
    }
    
    @IBAction private func nextButtonPressed(_ sender: UIButton) {
        print(#function)
        fetchTurnipPrices()
        saveTurnipPricesToUserDefaults()
    }
    
    // MARK: - Networking
    
    private func fetchTurnipPrices() {
        guard let purchasePrice = purchasePrice.text else { return }
        
        networkManager.fetchTurnipPriceData(purchasePrice: purchasePrice, dailyPrices: turnipPrices) { data in
            switch data {
            case.success(let priceData):
                NotificationCenter.default.post(name: .didCalculateResult, object: nil, userInfo: ["data": priceData])
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - User Defaults
    
    private func saveTurnipPricesToUserDefaults() {
        UserDefaults.standard.set(purchasePrice.text, forKey: UserDefaultsKeys.purchasePrice)
        UserDefaults.standard.set(turnipPrices, forKey: UserDefaultsKeys.turnipPrices)
        print("Data가 UserDefaults에 저장되었습니다.")
    }
    
    // MARK: - Gesture Recognizers

    private func addKeyboardDismissGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
