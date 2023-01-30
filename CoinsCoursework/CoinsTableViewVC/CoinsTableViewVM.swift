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
    
    var coinsStringsArray: [String] {get}
    
    func sortBy(_ changes: PriceChanges)
}

protocol CoinsTableViewProtocolOut {
    
    var coinsArrayClosure: ([CoinModel]) -> (){get set}
    
    var coinModel: (CoinModel) -> (){get set}
  
    
}

final class CoinsTableViewVM: CoinsTableViewProtocolIn, CoinsTableViewProtocolOut {

    
    
    var networkManager = NetworkManager()
    
    init() {
        networkManager.delegate = self
    }
    
    
    func changeRootController () {
    
        guard let window = mainNavigationController.navigationBar.window else {
            return
        }

        window.rootViewController = loginNavigationController
        window.makeKeyAndVisible()
        

    }
    
    let coinsStringsArray: [String] = ["btc", "eth", "tron", "lunc", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]
    
    var coinsArray: [CoinModel] = [] {
        didSet {
        
            coinsArrayClosure(coinsArray)
        }
    }
    
    var coinsArrayClosure: ([CoinModel]) -> () = { _ in}

    
    func getCoinsArray() {
       
        for coin in coinsStringsArray {
    
            networkManager.fetchCoin(coin: coin)
        }
    }
    
    func sortBy(_ changes: PriceChanges) {
        switch changes {
        case .ascendingPrisePerDay:
            break
        case .decreasePricePerDay:
            break
        case .ascendingPricePerHour:
            break
        case .decreasePricePerHour:
            break
        default:
            break
        }
    }
    
    var coinModel: (CoinModel) -> () = {_ in }

   
}

extension CoinsTableViewVM: NetworkingDelegate {
    func getCoinInformation(_ networking: NetworkManager, coin: CoinModel) {
        
//
//                DispatchQueue.main.async { [self] in
//                    coinsArray.append(coin)
//                    print(coin)
//                }
        

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
