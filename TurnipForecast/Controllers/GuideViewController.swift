//
//  GuideViewController.swift
//  TurnipForecast
//
//  Created by KangMingyo on 11/4/24.
//

import UIKit

final class GuideViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitle1Label: UILabel!
    @IBOutlet weak var body1Label: UILabel!
    @IBOutlet weak var subtitle2Label: UILabel!
    @IBOutlet weak var body2Label: UILabel!
    @IBOutlet weak var subtitle3Label: UILabel!
    @IBOutlet weak var body3Label: UILabel!
    @IBOutlet weak var subtitle4Label: UILabel!
    @IBOutlet weak var body4Label: UILabel!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureGuideLabels()
    }

    // MARK: - Configuration
    
    func configureGuideLabels() {
        titleLabel.text = "guide_title".localized
        
        subtitle1Label.text = "guide_subtitle1".localized
        body1Label.text = "guide_body1".localized
        
        subtitle2Label.text = "guide_subtitle2".localized
        body2Label.text = "guide_body1".localized
        
        subtitle3Label.text = "guide_subtitle3".localized
        body3Label.text = "guide_body1".localized
        
        subtitle4Label.text = "guide_subtitle4".localized
        body4Label.text = "guide_body1".localized
    }
}
