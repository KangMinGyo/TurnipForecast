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
        // UIHostingController를 사용하여 SwiftUI View(ChartView)를 포함
        let hostingController = UIHostingController(rootView: ChartView(dailyPriceData: dailyPriceData))
        
        // UIHostingController를 현재 VC의 자식 VC로 추가
        addChild(hostingController)
        
        view.addSubview(hostingController.view)
        
        hostingController.view.frame = view.frame

        // UIHostingController가 부모 뷰 컨트롤러에 추가됨을 알림
        hostingController.didMove(toParent: self)
    }
}
