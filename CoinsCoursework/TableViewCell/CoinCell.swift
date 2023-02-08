//
//  CoinCell.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 23.01.2023.
//

import UIKit

class CoinCell: UITableViewCell {
    
    public var coinModel: CoinModel? {
        didSet {
            guard let model = coinModel else {return}
            centerView.coinModel = model
            
        }
    }
    
    private var centerView = CenterView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.appBeige
        setHierarhy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private  func setHierarhy(){
        self.addSubview(centerView)
        
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            centerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            centerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            centerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            centerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            
        ])
    }
    
}


