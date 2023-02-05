//
//  DetailsViewController.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 20.01.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var viewModel: (DetailsVMProtocolIn & DetailsVMProtocolOut)?
    
    var coinModel: CoinModel? {
        didSet {
            
            guard let coin = coinModel else {return}
            iconView.image = UIImage.getIconForCoin(named: coin.name)
            nameLabel.text = coin.name
            symbolLabel.text = coin.symbol
            percentChangeUsdLast1Hourinfo.text = String(coin.percentChangeUsdLast1Hour)
            percentChangeUsdLast24HoursInfo.text = String(coin.percentChangeUsdLast24Hours)
            countOfActiveAddresses24HoursInfo.text = String(coin.countOfActiveAddresses24Hours)
            allTimesHightPriceInfo.text = String(coin.allTimesHightPrice)
            allTimesHightPriceDateInfo.text = DateFormatter().string(from: coin.allTimesHightPriceDate)
            let _: String = DateFormatter().string(from: coin.allTimesHightPriceDate)
            
        }
    }
    
    private lazy var topHorizontalStack = makeHorizontalTopStackView()
    private lazy var iconView = makeImageView()
    private lazy var topVerticalStack = makeVerticalTopStackView()
    private lazy var nameLabel = makeTitleLabel()
    private lazy var symbolLabel = makeTitleLabel()
    
    private lazy var verticalStackView = makeVerticalStackView()
    
    private lazy var percentChangeUsdLast1HourLabel = makeHeaderLabel(with: "Persent change last 1 hour:")
    private lazy var percentChangeUsdLast1Hourinfo = makeInfoLabel()
    private lazy var percentChangeUsdLast24HoursLabel = makeHeaderLabel(with: "Persent change last 24 hours:")
    private lazy var percentChangeUsdLast24HoursInfo = makeInfoLabel()
    private lazy var countOfActiveAddresses24HoursLabel = makeHeaderLabel(with: "Count of active addresses last 24 hours:" )
    private lazy var countOfActiveAddresses24HoursInfo = makeInfoLabel()
    
    private lazy var allTimesHightPriceLabel = makeHeaderLabel(with: "All times hight price:")
    private lazy var allTimesHightPriceInfo = makeInfoLabel()
    private lazy var allTimesHightPriceDate = makeHeaderLabel(with: "All times high price date:")
    private lazy var allTimesHightPriceDateInfo = makeInfoLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        mainNavigationController.isNavigationBarHidden = false
        setupVC()

        // Do any additional setup after loading the view.
    }

    private func setupVC() {
        view.backgroundColor = .appBeige
        mainNavigationController.navigationBar.tintColor = .appIndigo
        setupHierarhy()
        setupConstraints()
    }
    
    private func  setupHierarhy() {
        view.addSubview(mainNavigationController.navigationBar)
        view.addSubview(topHorizontalStack)
        topHorizontalStack.addArrangedSubview(iconView)
        topHorizontalStack.addArrangedSubview(topVerticalStack)
        topVerticalStack.addArrangedSubview(nameLabel)
        topVerticalStack.addArrangedSubview(symbolLabel)
        
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(percentChangeUsdLast1HourLabel)
        verticalStackView.addArrangedSubview(percentChangeUsdLast1Hourinfo)
        verticalStackView.addArrangedSubview(percentChangeUsdLast24HoursLabel)
        verticalStackView.addArrangedSubview(percentChangeUsdLast24HoursInfo)
        verticalStackView.addArrangedSubview(countOfActiveAddresses24HoursLabel)
        verticalStackView.addArrangedSubview(countOfActiveAddresses24HoursInfo)
        verticalStackView.addArrangedSubview(allTimesHightPriceLabel)
        verticalStackView.addArrangedSubview(allTimesHightPriceInfo)
        verticalStackView.addArrangedSubview(allTimesHightPriceDate)
        verticalStackView.addArrangedSubview(allTimesHightPriceDateInfo)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topHorizontalStack.topAnchor.constraint(equalTo: mainNavigationController.navigationBar.bottomAnchor, constant: 20),
            topHorizontalStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            topHorizontalStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            topHorizontalStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/6),
            
            verticalStackView.topAnchor.constraint(equalTo: topHorizontalStack.bottomAnchor, constant: 20),
            verticalStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            verticalStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)

        ])
     
    }
    
    func loadData() {
        updateViewConstraints()
    }
    
    override func updateViewConstraints(){
        super.updateViewConstraints()
        
    }
    
}
