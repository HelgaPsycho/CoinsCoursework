//
//  CoinsTableView.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import UIKit

class CoinsTableView: UITableView {
    
    var viewModel: (CoinsTableViewProtocolIn & CoinsTableViewProtocolOut)?
    var coinsStringsArray: [String] = CoinModel.coinsStringsArray
    
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .plain)
        backgroundColor = .red
    
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


