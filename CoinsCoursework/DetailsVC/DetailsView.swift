//
//  DetailsView.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 03.02.2023.
//

import UIKit

class DetailsView: UIView {
    
//    var coinModel: CoinModel? //? {
//    //        didSet {
//    //
//    //            guard let coin = coinModel else {return}
//    //            iconView.image = UIImage.getIconForCoin(named: coin.name)
//    //            nameLabel.text = coin.name
//    //            symbolLabel.text = coin.symbol
//    //            topHorizontalStack.updateConstraints()
//    //            topVerticalStack.updateConstraints()
//    //
//    //            setNeedsLayout()
//    //        }
//    //    }
//    
//    private lazy var topHorizontalStack = makeHorizontalTopStackView()
//    private lazy var iconView = makeImageView()
//    private lazy var topVerticalStack = makeVerticalTopStackView()
//    private lazy var nameLabel = makeTitleLabel()
//    private lazy var symbolLabel = makeTitleLabel()
//    
//    init(frame: CGRect, coinModel: CoinModel) {
//        super.init(frame: frame)
//        self.coinModel = coinModel
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupVC() {
//        
//        guard let coin = coinModel else {return}
//        iconView.image = UIImage.getIconForCoin(named: coin.name)
//        nameLabel.text = coin.name
//        symbolLabel.text = coin.symbol
//        
//        setupHierarhy()
//        setupConstraints()
//    }
//    
//    private func  setupHierarhy() {
//        self.addSubview(topHorizontalStack)
//        topHorizontalStack.addArrangedSubview(iconView)
//        topHorizontalStack.addArrangedSubview(topVerticalStack)
//        topVerticalStack.addArrangedSubview(nameLabel)
//        topVerticalStack.addArrangedSubview(symbolLabel)
//    }
//    
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            topHorizontalStack.topAnchor.constraint(equalTo: self.topAnchor, constant:  -20),
//            topHorizontalStack.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
//            topHorizontalStack.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
//            topHorizontalStack.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1/4)
//            
//        ])
//        
//    }
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        setupConstraints()
//    }
}
