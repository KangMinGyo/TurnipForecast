//
//  ResultViewController.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/30/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var tablesView: UIView!
    @IBOutlet weak var graphsView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        graphsView.isHidden = true
        
    }
    
    @IBAction func changeView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tablesView.isHidden = false
            graphsView.isHidden = true
        case 1:
            tablesView.isHidden = true
            graphsView.isHidden = false
        default:
            break
        }
    }
}
