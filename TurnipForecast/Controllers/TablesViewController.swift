//
//  TablesViewController.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/30/24.
//

import UIKit

class TablesViewController: UIViewController {

    @IBOutlet weak var pricesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pricesTableView.dataSource = self
    }
    
}

extension TablesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pricesTableView.dequeueReusableCell(withIdentifier: Cell.pricesCellIdentifier, for: indexPath) as! PricesCell
        cell.dayLabel.text = "월요일"
        cell.dayTimePrice.text = "80"
        cell.nightTimePrice.text = "80"
        return cell
    }
}
