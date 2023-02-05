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
    
    let coinsStringsArray: [String] = ["busd", "btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]

    var counter = 0
    
    var networkManager = NetworkManager()
    
    let coinsDispatchGroup = DispatchGroup()
    
    var coinsArrayClosure: ([CoinModel]) -> () = { _ in}

    
    init() {
       listenNetwork()
    }
    
    //MARK: -  CoinsTableViewProtocolIn
    func changeRootController () {
    print("changeRootController in VM called")
        mainNavigationController.isNavigationBarHidden = false
        guard let window = mainNavigationController.navigationBar.window else {
            return
        }

        window.rootViewController = loginNavigationController
        print(loginNavigationController)
        window.makeKeyAndVisible()
        
    }
    
     var coinsArray: [CoinModel] = []
    
    func getCoinsArray() {
        coinsArray = []
        coinsArrayClosure([])
        DispatchQueue.global(qos: .userInitiated).async {
            self.networkManager.getCoinsModelsArray(coinsStrings: self.coinsStringsArray)
        }
    }

    func listenNetwork() {
        networkManager.giveResponse = {[weak self] array in
            self?.setCoinsArray(coinsArray: array)
            for i in array {
                print(i.name)
            }
        
        }
        
        networkManager.catchError = { error in
            print(error)
            
        }
    }
    
    func setCoinsArray(coinsArray: [CoinModel]){
        coinsArrayClosure(coinsArray)
        self.coinsArray = coinsArray
    }
    
    func sortBy(_ changes: PriceChanges) {
        switch changes {
        case .ascendingPrisePerDay:
            coinsArray = coinsArray.sorted(by: { $0.percentChangeUsdLast24Hours < $1.percentChangeUsdLast24Hours })
            coinsArrayClosure(coinsArray)
        case .decreasePricePerDay:
            coinsArray = coinsArray.sorted(by: { $0.percentChangeUsdLast24Hours > $1.percentChangeUsdLast24Hours })
            coinsArrayClosure(coinsArray)
        case .ascendingPricePerHour:
            coinsArray = coinsArray.sorted(by: { $0.percentChangeUsdLast1Hour < $1.percentChangeUsdLast1Hour })
            coinsArrayClosure(coinsArray)
        case .decreasePricePerHour:
            coinsArray = coinsArray.sorted(by: { $0.percentChangeUsdLast1Hour > $1.percentChangeUsdLast1Hour })
            coinsArrayClosure(coinsArray)
        default:
            break
        }
    }
    
    
    var coinModel: (CoinModel) -> () = {_ in }
    
   
}



enum PriceChanges {
    case ascendingPrisePerDay
    case decreasePricePerDay
    case ascendingPricePerHour
    case decreasePricePerHour
}
