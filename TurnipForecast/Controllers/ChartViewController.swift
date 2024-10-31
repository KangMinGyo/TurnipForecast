//
//  GraphViewController.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/30/24.
//

import UIKit
import SwiftUI

class ChartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        let controller = UIHostingController(rootView: ChartView())
        guard let chartView = controller.view else { return }
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chartView)
        NSLayoutConstraint.activate([
            chartView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chartView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            chartView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}
