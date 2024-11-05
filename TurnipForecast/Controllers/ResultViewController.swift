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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var turnipPrices: [String] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .label
        segmentedControl.setTitle("segment_one".localized, forSegmentAt: 0)
        segmentedControl.setTitle("segment_two".localized, forSegmentAt: 1)
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
