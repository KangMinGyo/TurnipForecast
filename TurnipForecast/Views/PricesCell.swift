//
//  PricesTableViewCell.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/30/24.
//

import UIKit

final class PricesCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayTimePrice: UILabel!
    @IBOutlet weak var nightTimePrice: UILabel!
    
    var dailyPriceData: DailyPriceData? {
        didSet {
            guard let data = dailyPriceData else { return }
            dayLabel.text = data.day
            dayTimePrice.text = data.dayMin == data.dayMax
            ? "☀️ 오전 : \(Int(data.dayMin))"
            : "☀️ 오전 : \(Int(data.dayMin)) - \(Int(data.dayMax))"
            nightTimePrice.text = data.nightMin == data.nightMax
            ? "🌙 오후 : \(Int(data.nightMin))"
            :"🌙 오후 : \(Int(data.nightMin)) - \(Int(data.nightMax))"
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

    }

}
