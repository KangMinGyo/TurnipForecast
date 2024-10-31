//
//  ResultViewController.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/30/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var tablesView: UIView!
    @IBOutlet weak var graphView: UIView!
    
    var turnipPrices: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        graphView.isHidden = true
    }

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
