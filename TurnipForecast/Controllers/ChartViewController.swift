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

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNotifications()
    }
    
    // MARK: - Notifications
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.receiveData), name: .didCalculateResult, object: nil)
    }
    
    @objc private func receiveData(_ noti: Notification) {
        print(#function)
        guard let data = noti.userInfo?["data"] as? TurnipPriceData else { return }
        self.turnipPrices = data

        DispatchQueue.main.async {
            self.prepareChartData()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //  MARK: - Setup Chart View
    
    func prepareChartData() {
        guard let data = turnipPrices else { return }
        let dailyPriceData = DailyPriceData.convertFromTurnipPriceData(turnipPriceData: data)
        setupChartView(with: dailyPriceData) 
    }
    
    private func setupChartView(with dailyPriceData: [DailyPriceData]) {
        let controller = UIHostingController(rootView: ChartView(dailyPriceData: dailyPriceData))
        
        guard let chartView = controller.view else { return }
        view.addSubview(chartView)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: view.topAnchor),
            chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
