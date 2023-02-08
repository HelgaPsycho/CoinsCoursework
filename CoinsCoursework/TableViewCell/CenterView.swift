//
//  CenterView.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 27.01.2023.
//

import UIKit

class CenterView: UIView {
    
    
    public var coinModel: CoinModel? {
        didSet {
            
            guard let model = coinModel else {return}
            
            iconView.image = CoinCellViewModel.shared.getIconForCoin(named: model.name) //?? UIImage(systemName: "questionmark.square.dashed")
            titleLabel.text = model.name
            priceLabel.text = CoinCellViewModel.shared.getFormattedString(string: model.priceUsd, symbol: " $")
            changeLastHourLabel.text = "Change last hour:"
            persentsPerHour.text =  CoinCellViewModel.shared.getFormattedString(string: model.percentChangeUsdLast1Hour, symbol: " %")
            changeLastDayLabel.text = "Change last day:"
            persaentsPerDay.text = CoinCellViewModel.shared.getFormattedString(string: model.percentChangeUsdLast24Hours, symbol: " %")
            
        }
    }
    
    private lazy var iconView = makeIconView()
    
    private  lazy var stackView = makeVerticalStackView()
    private lazy var titleLabel = makeTitleLabel()
    private lazy var priceLabel = makeTitleLabel()
    
    private lazy var changeLastHourLabel = makeBodyTitleyLabel()
    private lazy var persentsPerHour = makeBodyLabel()
    private lazy var changeLastDayLabel = makeBodyTitleyLabel()
    private lazy var persaentsPerDay = makeBodyLabel()
    
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        backgroundColor = UIColor.appIndigo
        setupHierarhy()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupHierarhy() {
        
        self.addSubview(iconView)
        self.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(changeLastHourLabel)
        stackView.addArrangedSubview(persentsPerHour)
        stackView.addArrangedSubview(changeLastDayLabel)
        stackView.addArrangedSubview(persaentsPerDay)
        
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            iconView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3),
            iconView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 2/3),
            
            stackView.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            
        ])
    }
    
    
    
}
