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
        titleLabel.text = "무 주식 계산기 사용법"
        
        subtitle1Label.text = "1. 매수가"
        body1Label.text = "매주 일요일, 무파니에게 무를 구매해주세요. \n무의 가격을 매수가란에 입력해주세요. \n이 가격은 한 주 동안의 거래 기준 가격이 됩니다."
        
        subtitle2Label.text = "2. 가격 입력"
        body2Label.text = "월요일부터 토요일까지, \n오전과 오후 무 가격을 입력합니다. \n각각의 날짜와 시간대에 맞게 값을 기록하면, \n프로그램이 데이터를 사용해 예측할 수 있습니다."
        
        subtitle3Label.text = "3. 무 값 확인하기"
        body3Label.text = "데이터를 입력하고 나면, \n프로그램이 예측 가격을 보여줍니다.\n데이터를 많이 입력할 수록 정확도가 높아집니다.\n예측 가격을 통해 남은 기간 동안의 \n무 주식 가격 변동을 확인할 수 있습니다."
        
        subtitle4Label.text = "4. 초기화"
        body4Label.text = "입력한 데이터를 초기화하고 새로운 데이터를 \n입력하고 싶을 때는 초기화 버튼을 누르세요.\n초기화 버튼을 누르기 전까지 입력된 데이터는 저장됩니다."
    }
}
