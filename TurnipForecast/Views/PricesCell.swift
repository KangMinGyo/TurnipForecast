//
//  PricesTableViewCell.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/30/24.
//

import UIKit

class PricesCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayTimePrice: UILabel!
    @IBOutlet weak var nightTimePrice: UILabel!
    
    var dailyPriceData: DailyPriceData? {
        didSet {
            guard let data = dailyPriceData else { return }
            dayLabel.text = data.day
            dayTimePrice.text = "\(data.minDay) ~ \(data.maxDay)"
            nightTimePrice.text = "\(data.minNight) ~ \(data.maxNight)"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dayLabel.text = nil
        dayTimePrice.text = nil
        nightTimePrice.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
