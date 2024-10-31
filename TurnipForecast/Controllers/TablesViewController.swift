//
//  TablesViewController.swift
//  TurnipForecast
//
//  Created by KangMingyo on 10/30/24.
//

import UIKit

class TablesViewController: UIViewController {

    @IBOutlet weak var pricesTableView: UITableView!
    var loadingIndicator: UIActivityIndicatorView!
    
    var turnipPrices: TurnipPriceData?
    
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
    
    private func setupTableView() {
        pricesTableView.dataSource = self
        pricesTableView.rowHeight = 100
    }
    
    private func setupLoadingIndicator() {
        pricesTableView.isHidden = true
        
        loadingIndicator = UIActivityIndicatorView(style: .medium)
        loadingIndicator.center = view.center
        view.addSubview(loadingIndicator)
        loadingIndicator.startAnimating() // 로딩 시작
    }
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.receiveData), name: .didCalculateResult, object: nil)
    }
    
    @objc private func receiveData(_ noti: Notification) {
        print(#function)
        guard let data = noti.userInfo?["data"] as? TurnipPriceData else { return }
        self.turnipPrices = data
        
        DispatchQueue.main.async {
            self.pricesTableView.reloadData()
            self.loadingIndicator.stopAnimating() // 로딩 중지
            self.loadingIndicator.isHidden = true
            self.pricesTableView.isHidden = false // 데이터 로딩 후 테이블 뷰 표시
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension TablesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        let cell = pricesTableView.dequeueReusableCell(withIdentifier: Cell.pricesCellIdentifier, for: indexPath) as! PricesCell
        guard let data = turnipPrices else { return UITableViewCell() }
        let dailyPriceData = DailyPriceData.convertFromTurnipPriceData(turnipPriceData: data)
        print("dailyPriceData: \(dailyPriceData)")
        cell.dailyPriceData = dailyPriceData[indexPath.row]
        
        cell.isUserInteractionEnabled = false
        return cell
    }
}
