//
//  ResultViewController.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/30/24.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var tablesView: UIView!
    @IBOutlet weak var graphView: UIView!
    
    var turnipPrices: [String] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .label
        graphView.isHidden = true
    }

    // MARK: - Actions
    
    @IBAction func changeView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tablesView.isHidden = false
            graphView.isHidden = true
        case 1:
            tablesView.isHidden = true
            graphView.isHidden = false
        default:
            break
        }
    }
}
