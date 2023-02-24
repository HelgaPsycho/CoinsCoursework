//
//  DetailsViewController.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 20.01.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var viewModel: (DetailsVMProtocolIn & DetailsVMProtocolOut)?
    
    var formatedCoin: FormatedCoinModel? {
        didSet {
            guard let coin = formatedCoin else {return}
            iconView.image = UIImage.getIconForCoin(named: coin.name)
            nameLabel.text = coin.name
            symbolLabel.text = coin.symbol
            priceUsdInfo.text = coin.priceUsd
            percentChangeUsdLast1Hourinfo.text = coin.percentChangeUsdLast1Hour
            percentChangeUsdLast24HoursInfo.text = coin.percentChangeUsdLast24Hours
            countOfActiveAddresses24HoursInfo.text = coin.countOfActiveAddresses24Hours
            allTimesHightPriceInfo.text = coin.allTimesHightPrice
            allTimesHightPriceDateInfo.text = coin.allTimesHightPriceDate
            
        }
    }
    
    private lazy var topHorizontalStack = makeHorizontalTopStackView()
    private lazy var iconView = makeImageView()
    private lazy var topVerticalStack = makeVerticalTopStackView()
    private lazy var nameLabel = makeTitleLabel()
    private lazy var symbolLabel = makeTitleLabel()
    
    private lazy var centralView = makeCentralView()
    private lazy var verticalStackView = makeVerticalStackView()
    
    private lazy var  priceUsdLabel = makeHeaderLabel(with: "Price in USD:")
    private lazy var priceUsdInfo = makeInfoLabel()
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
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, viewModel: DetailsViewModel) {
        super .init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.viewModel = viewModel
        listenViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //mainNavigationController.isNavigationBarHidden = false
        setupVC()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel?.router?.navigationController?.isNavigationBarHidden = false
    }
    
    
    private func setupVC() {
        view.backgroundColor = .appBeige
        viewModel?.router?.navigationController?.navigationBar.tintColor = .appIndigo
        setupHierarhy()
        setupConstraints()
        
    }
    
    private func  setupHierarhy() {
        if let navBar = viewModel?.router?.navigationController?.navigationBar {
            view.addSubview(navBar)}
        view.addSubview(topHorizontalStack)
        topHorizontalStack.addArrangedSubview(iconView)
        topHorizontalStack.addArrangedSubview(topVerticalStack)
        topVerticalStack.addArrangedSubview(nameLabel)
        topVerticalStack.addArrangedSubview(symbolLabel)
        
        view.addSubview(centralView)
        centralView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(priceUsdLabel)
        verticalStackView.addArrangedSubview(priceUsdInfo)
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
            topHorizontalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topHorizontalStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            topHorizontalStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            topHorizontalStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/6),
            
            centralView.topAnchor.constraint(equalTo: topHorizontalStack.bottomAnchor, constant: 20),
            centralView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            centralView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            centralView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            verticalStackView.topAnchor.constraint(equalTo: centralView.topAnchor, constant: 20),
            verticalStackView.leftAnchor.constraint(equalTo: centralView.leftAnchor, constant: 20),
            verticalStackView.rightAnchor.constraint(equalTo: centralView.rightAnchor, constant: -20),
            verticalStackView.bottomAnchor.constraint(equalTo: centralView.bottomAnchor, constant: -20)
            
        ])
        
    }
    
    private func listenViewModel() {
        guard var VM = viewModel else {return}
        VM.catchFormattedCoinModel = {[weak self] coin in
            self?.updateFotmattedCoin(coin: coin)
            
        }
    }
    
    func updateFotmattedCoin(coin: FormatedCoinModel){
        formatedCoin = coin
        
    }
}
