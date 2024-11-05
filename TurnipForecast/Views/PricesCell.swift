//
//  PricesTableViewCell.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/30/24.
//

import UIKit

final class PricesCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var dailyPriceData: DailyPriceData? {
        didSet {
            guard let data = dailyPriceData else { return }
            dayLabel.text = data.day
            priceLabel.text = data.minPrice == data.maxPrice
            ? "\(Int(data.minPrice))"
            : "\(Int(data.minPrice)) - \(Int(data.maxPrice))"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dayLabel.text = nil
        priceLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
