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
        titleLabel.text = "Guide_Title".localized
        
        subtitle1Label.text = "Guide_Subtitle1".localized
        body1Label.text = "Guide_Body1".localized
        
        subtitle2Label.text = "Guide_Subtitle2".localized
        body2Label.text = "Guide_Body2".localized
        
        subtitle3Label.text = "Guide_Subtitle3".localized
        body3Label.text = "Guide_Body3".localized
        
        subtitle4Label.text = "Guide_Subtitle4".localized
        body4Label.text = "Guide_Body4".localized
    }
}
