//
//  CardDetailViewController.swift
//  CreditCardList
//
//  Created by Jeongguk Kim on 2022/07/06.
//


import UIKit
import Lottie

class CardDetailViewController: UIViewController {
    
    var promotionDetail: PromotionDetail?
    
    
    @IBOutlet weak var lottieView: AnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var benefitConditionLabel: UILabel!
    @IBOutlet weak var benefitDetailLabel: UILabel!
    @IBOutlet weak var benefitDateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = AnimationView(name: "money")
        lottieView.contentMode = .scaleAspectFit
        lottieView.addSubview(animationView)
        animationView.frame = lottieView.bounds
        animationView.loopMode = .loop
        animationView.play()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let detail = promotionDetail else { return }
        
        titleLabel.text = """
        \(detail.companyName)카드 쓰먄
        \(detail.amount)만원 드려요
        """
        periodLabel.text = detail.period
        conditionLabel.text = detail.condition
        benefitDateLabel.text = detail.benefitDetail
        benefitDetailLabel.text = detail.benefitDetail
        benefitConditionLabel.text = detail.benefitCondition
        
    }
}