//
//  CoinsTableViewVM.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import Foundation
import UIKit

protocol CoinsTableViewProtocolIn {
    
    func changeRootController()
    
    func getCoinsArray()
    
    //var coinsStringsArray: [String] {get}
    
    func sortBy(_ changes: PriceChanges)
}

protocol CoinsTableViewProtocolOut {
    
    var coinsArrayClosure: ([CoinModel]) -> (){get set}
    
    var coinModel: (CoinModel) -> (){get set}
  
    
}

final class CoinsTableViewVM: CoinsTableViewProtocolIn, CoinsTableViewProtocolOut {
    
    let coinsStringsArray: [String] = ["btc", "eth", "tron", "lunc", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]

    var networkManager = NetworkManager()
    
    init() {
        networkManager.delegate = self
    }
    
    //MARK: -  CoinsTableViewProtocolIn
    func changeRootController () {
    
        guard let window = mainNavigationController.navigationBar.window else {
            return
        }

        window.rootViewController = loginNavigationController
        window.makeKeyAndVisible()
        
    }
    
    
    var coinsArray: [CoinModel] = [] {
        didSet {
            coinsArrayClosure(coinsArray)
        }
    }
    
    func getCoinsArray() {
        coinsArray = []
        for coin in coinsStringsArray {
    
            networkManager.fetchCoin(coin: coin)
        }
    }
    
    func sortBy(_ changes: PriceChanges) {
        switch changes {
        case .ascendingPrisePerDay:
            coinsArray = coinsArray.sorted(by: { $0.percentChangeUsdLast24Hours < $1.percentChangeUsdLast24Hours })
        case .decreasePricePerDay:
            coinsArray = coinsArray.sorted(by: { $0.percentChangeUsdLast24Hours > $1.percentChangeUsdLast24Hours })
        case .ascendingPricePerHour:
            coinsArray = coinsArray.sorted(by: { $0.percentChangeUsdLast1Hour < $1.percentChangeUsdLast1Hour })
        case .decreasePricePerHour:
            coinsArray = coinsArray.sorted(by: { $0.percentChangeUsdLast1Hour > $1.percentChangeUsdLast1Hour })
        default:
            break
        }
    }
    
    
    var coinModel: (CoinModel) -> () = {_ in }
    
    var coinsArrayClosure: ([CoinModel]) -> () = { _ in}

   
}

extension CoinsTableViewVM: NetworkingDelegate {
    
    func getCoinInformation(_ networking: NetworkManager, coin: CoinModel) {
        
        coinsArray.append(coin)
        coinsArray = coinsArray.compactMap{$0}
    
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

}

enum PriceChanges {
    case ascendingPrisePerDay
    case decreasePricePerDay
    case ascendingPricePerHour
    case decreasePricePerHour
}
