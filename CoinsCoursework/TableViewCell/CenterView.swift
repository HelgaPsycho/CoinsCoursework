//
//  CenterView.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 27.01.2023.
//

import UIKit

class CenterView: UIView {
    
    
    var coinModel: CoinModel? {
        didSet {
            
            guard let model = coinModel else {return}
            
//            activityIndicator.isHidden = true
//            activityIndicator.stopAnimating()
            iconView.image = CoinCellViewModel.shared.getIconForCoin(named: model.name) ?? UIImage(systemName: "questionmark.square.dashed")
            titleLabel.text = model.name
            priceLabel.text = CoinCellViewModel.shared.getFormattedPrice(price: model.priceUsd)
            changeLastHourLabel.text = "Change last hour:"
            persentsPerHour.text =  CoinCellViewModel.shared.getFormattedPercents(percent: model.percentChangeUsdLast1Hour)
            changeLastDayLabel.text = "Change last day:"
            persaentsPerDay.text = CoinCellViewModel.shared.getFormattedPercents(percent: model.percentChangeUsdLast24Hours)
            
        }
    }
  //  lazy  var activityIndicator = makeActivityIndicator()
    lazy var iconView = makeIconView()
    
    lazy var stackView = makeVerticalStackView()
    lazy var titleLabel = makeTitleLabel()
    lazy var priceLabel = makeTitleLabel()
    
    lazy var changeLastHourLabel = makeBodyTitleyLabel()
    lazy var persentsPerHour = makeBodyLabel()
    lazy var changeLastDayLabel = makeBodyTitleyLabel()
    lazy var persaentsPerDay = makeBodyLabel()
    
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        backgroundColor = UIColor.appIndigo
        setupHierarhy()
        setupConstraints()
//        activityIndicator.isHidden = false
//        activityIndicator.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setupHierarhy() {
        
      //  self.addSubview(activityIndicator)
        self.addSubview(iconView)
        self.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(changeLastHourLabel)
        stackView.addArrangedSubview(persentsPerHour)
        stackView.addArrangedSubview(changeLastDayLabel)
        stackView.addArrangedSubview(persaentsPerDay)
    
        
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            iconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3),
            iconView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3),
            
            stackView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
//            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
//            activityIndicator.heightAnchor.constraint(equalTo: self.heightAnchor),
//            activityIndicator.widthAnchor.constraint(equalTo: self.widthAnchor)
            
        ])
    }
    
    
    
}
