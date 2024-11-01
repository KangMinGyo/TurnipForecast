//
//  GraphViewController.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/30/24.
//

import UIKit
import SwiftUI

final class ChartViewController: UIViewController {
    
    var turnipPrices: TurnipPriceData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNotifications()
    }
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.receiveData), name: .didCalculateResult, object: nil)
    }
    
    @objc private func receiveData(_ noti: Notification) {
        print(#function)
        guard let data = noti.userInfo?["data"] as? TurnipPriceData else { return }
        self.turnipPrices = data
        
        print("Received data: \(data)")
        DispatchQueue.main.async {
            self.setupView()
        }
    }
    
    func setupView() {
        guard let data = turnipPrices else { return }
        let dailyPriceData = DailyPriceData.convertFromTurnipPriceData(turnipPriceData: data)
        print("dailyPriceData: \(dailyPriceData)")
        
        let controller = UIHostingController(rootView: ChartView(dailyPriceData: dailyPriceData))
        guard let chartView = controller.view else { return }
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chartView)
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: view.topAnchor),
            chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
