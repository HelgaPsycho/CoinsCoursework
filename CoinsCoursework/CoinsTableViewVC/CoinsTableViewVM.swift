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
    
        guard let window = navigationController.navigationBar.window else {
            return
        }

        window.rootViewController = loginNavigationController
        window.makeKeyAndVisible()

    }
    
    let coinsStringsArray: [String] = ["btc", "eth", "tron", "lunc", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]
    
    var coinsArray: [CoinModel] = [] {
        didSet {
            print("coinsArray update")
            coinsArrayClosure(coinsArray)
        }
    }
    
    var coinsArrayClosure: ([CoinModel]) -> () = { _ in}

    
    func getCoinsArray() {
        print ("getCounsArray called")
        for coin in coinsStringsArray {
            networkManager.fetchCoin(coin: coin)
        }
    }
    
    var coinModel: (CoinModel) -> () = {_ in }

   
}

extension CoinsTableViewVM: NetworkingDelegate {
    func getCoinInformation(_ networking: NetworkManager, coin: CoinModel) {
        
//
//                DispatchQueue.main.async { [self] in
//                    coinModel(coin)
//                    print(coin)
//                }
//        coinModel(coin)
//        print(coin)
//        
//
        coinsArray.append(coin)
        print("coins array append coin")
//
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
