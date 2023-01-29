//
//  CoinsTableViewVM.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import Foundation

protocol CoinsTableViewProtocolIn {
    
    func getCoinsArray()
    
    func getCoin(named: String)
}

protocol CoinsTableViewProtocolOut {
    
    var setCoinsArray: (Array<String>) -> Void {get set}
    
    var coinModel: (CoinModel) -> Void {get set}
    
}

class CoinsTableViewVM: CoinsTableViewProtocolIn, CoinsTableViewProtocolOut {
        
    var setCoinsArray: (Array<String>) -> Void = { _ in}
    
    var coinModel: (CoinModel) -> Void = { _ in}
    
    let coinsArray = CoinModel.coinsStringsArray
    
    func getCoinsArray() {
        print("getCoinsArrayCalled")
        self.setCoinsArray(coinsArray)
    }
    
    let model = CoinModel(symbol: "btc", name: "Bitcoin", priceUsd: 4566.8908, percentChangeUsdLast1Hour: 0.0, percentChangeUsdLast24Hours: 0.0)
    
    func getCoin(named: String) {
        coinModel(model)
    }

    func configurateDataForCell() {
        
    }
   
}

extension CoinsTableViewVM: NetworkingDelegate {
    func getCoinInformation(_ networking: NetworkManager, coin: CoinModel) {
        DispatchQueue.main.async {
          
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
