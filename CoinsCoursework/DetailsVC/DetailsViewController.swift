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
            topHorizontalStack.updateConstraints()
            topVerticalStack.updateConstraints()
            
        }
    }
    
    private lazy var topHorizontalStack = makeHorizontalTopStackView()
    private lazy var iconView = makeImageView()
    private lazy var topVerticalStack = makeVerticalTopStackView()
    private lazy var nameLabel = makeTitleLabel()
    private lazy var symbolLabel = makeTitleLabel()
    

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
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topHorizontalStack.topAnchor.constraint(equalTo: mainNavigationController.navigationBar.bottomAnchor, constant: 50),
            topHorizontalStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            topHorizontalStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            topHorizontalStack.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4)

        ])
     
    }
}
