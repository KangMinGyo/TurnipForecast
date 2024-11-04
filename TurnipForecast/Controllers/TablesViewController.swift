//
//  TablesViewController.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/30/24.
//

import UIKit

final class TablesViewController: UIViewController {

    @IBOutlet weak var pricesTableView: UITableView!
    var loadingIndicator: UIActivityIndicatorView!

    var turnipPrices: TurnipPriceData?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoadingIndicator()
        registerNotifications()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        pricesTableView.reloadData()
    }
    
    // MARK: - Setup Methods
    
    private func setupTableView() {
        pricesTableView.dataSource = self
        pricesTableView.rowHeight = 100
    }
    
    private func setupLoadingIndicator() {
        loadingIndicator = UIActivityIndicatorView(style: .medium)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loadingIndicator)
        
        NSLayoutConstraint.activate([
            loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60)
        ])
        loadingIndicator.startAnimating()
    }
    
    // MARK: - Notifications
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.receiveData), name: .didCalculateResult, object: nil)
    }
    
    @objc private func receiveData(_ noti: Notification) {
        print(#function)
        guard let data = noti.userInfo?["data"] as? TurnipPriceData else { return }
        self.turnipPrices = data
        
        DispatchQueue.main.async {
            self.pricesTableView.reloadData()
            self.loadingIndicator.stopAnimating()
            self.loadingIndicator.isHidden = true
            self.pricesTableView.isHidden = false
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: - UITableViewDataSource

extension TablesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pricesTableView.dequeueReusableCell(withIdentifier: Cell.pricesCellIdentifier, for: indexPath) as! PricesCell
        guard let data = turnipPrices else { return UITableViewCell() }
        let dailyPriceData = DailyPriceData.convertFromTurnipPriceData(turnipPriceData: data)
        cell.dailyPriceData = dailyPriceData[indexPath.row]
        cell.isUserInteractionEnabled = false
        
        return cell
    }
}
