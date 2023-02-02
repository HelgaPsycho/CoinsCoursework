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
    
    func sortBy(_ changes: PriceChanges)
}

protocol CoinsTableViewProtocolOut {
    
    var coinsArrayClosure: ([CoinModel]) -> (){get set}
    
    
}

final class CoinsTableViewVM: CoinsTableViewProtocolIn, CoinsTableViewProtocolOut {
    
    let coinsStringsArray: [String] = ["btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]

    var counter = 0
    
    var networkManager = NetworkManager()
    
    let coinsDispatchGroup = DispatchGroup()
    
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
    
    var coinsArray: [CoinModel] = []
    
    func getCoinsArray() {
        coinsArray = []
        for coin in coinsStringsArray {
            counter = counter + 1
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
        counter = counter - 1
        coinsArray.append(coin)
        checkCounter()
    
    }
    
    func didFailWithError(error: Error) {
       counter = counter - 1
        print(error)
        checkCounter()
    }
    
    func checkCounter(){
        if counter != 0 {
            return
        } else {
            coinsArrayClosure(coinsArray)
        }
    }

}

enum PriceChanges {
    case ascendingPrisePerDay
    case decreasePricePerDay
    case ascendingPricePerHour
    case decreasePricePerHour
}
