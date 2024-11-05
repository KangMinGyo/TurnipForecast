//
//  ViewController.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/23/24.
//

import UIKit

final class CalculateViewController: UIViewController {
    
    @IBOutlet weak var purchaseLabel: UILabel!
    @IBOutlet var timeLabels: [UILabel]!
    @IBOutlet var dayLabels: [UILabel]!
    
    @IBOutlet weak var purchasePriceTextField: UITextField!
    @IBOutlet var dailyTurnipPrices: [UITextField]!
    
    @IBOutlet weak var initializeButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var turnipPrices: [String] {
        return dailyTurnipPrices.map { $0.text ?? "" }
    }
    
    let networkManager = NetworkManager()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDataToTextFields()
        configureLocalization()
        addKeyboardDismissGesture()
    }
    
    // MARK: - Localization
    
    private func configureLocalization() {
        self.navigationItem.title = "navi_title".localized
        
        purchaseLabel.text = "purchase_price".localized
        purchasePriceTextField.placeholder = "purchase_price".localized
        
        let times = ["morning", "afternoon"].map { $0.localized }
        times.enumerated().forEach { index, time in
            timeLabels[index].text = time
        }
        
        let weekDays = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday"].map { $0.localized }
        weekDays.enumerated().forEach { index, day in
            dayLabels[index].text = day
        }
        
        initializeButton.setTitle("initialize_button".localized, for: .normal)
        nextButton.setTitle("next_button".localized, for: .normal)
    }
    
    // MARK: - Data Loading
    
    private func loadDataToTextFields() {
        guard let purchasePrice = UserDefaults.standard.string(forKey: UserDefaultsKeys.purchasePrice) else { return }
        guard let savedTurnipPrices = UserDefaults.standard.stringArray(forKey: UserDefaultsKeys.turnipPrices) else { return }
        
        self.purchasePriceTextField.text = purchasePrice
        for (textField, price) in zip(dailyTurnipPrices, savedTurnipPrices) {
            textField.text = price
        }
    }
    
    // MARK: - Actions
    
    @IBAction private func resetButtonTapped(_ sender: UIButton) {
        print(#function)
        purchasePriceTextField.text = ""
        
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
        guard let purchasePrice = purchasePriceTextField.text else { return }
        
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
        UserDefaults.standard.set(purchasePriceTextField.text, forKey: UserDefaultsKeys.purchasePrice)
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
