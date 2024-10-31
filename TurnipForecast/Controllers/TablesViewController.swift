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
        
        setupLoadingIndicator() // 로딩 인디케이터 설정
        pricesTableView.isHidden = true // 초기에는 테이블 뷰를 숨깁니다.
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.receiveData), name: NotiName.turnipPriceData, object: nil)
        
        pricesTableView.dataSource = self
    }
    
    private func setupLoadingIndicator() {
        loadingIndicator = UIActivityIndicatorView(style: .medium)
        loadingIndicator.center = view.center
        view.addSubview(loadingIndicator)
        loadingIndicator.startAnimating() // 로딩 시작
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print("테이블 뷰 리로드")
        pricesTableView.reloadData()
    }
    
    @objc private func receiveData(_ noti: Notification) {
        print(#function)
        guard let data = noti.userInfo?["data"] as? TurnipPriceData else { return }
        self.turnipPrices = data
        print("turnipPrices: \(turnipPrices)")
        self.pricesTableView.reloadData()
        
        loadingIndicator.stopAnimating() // 로딩 중지
        loadingIndicator.isHidden = true
        pricesTableView.isHidden = false // 데이터 로딩 후 테이블 뷰 표시
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
        let cell = pricesTableView.dequeueReusableCell(withIdentifier: Cell.pricesCellIdentifier, for: indexPath) as! PricesCell
        guard let data = turnipPrices else { return UITableViewCell() }
        let dailyPriceData = DailyPriceData.convertFromTurnipPriceData(turnipPriceData: data)
        print("dailyPriceData: \(dailyPriceData)")
        cell.dailyPriceData = dailyPriceData[indexPath.row]
        return cell
    }
}
