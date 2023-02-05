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
    
    var networkManager: (NetworkManagerProtocolIn & NetworkManagerProtocolOut)?
    
    private var coinsArray: [CoinModel] = []
    
    var coinsArrayClosure: ([CoinModel]) -> () = { _ in}
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
       listenNetwork()
    }
    
    //MARK: -  CoinsTableViewProtocolIn
    func changeRootController () {

        mainNavigationController.isNavigationBarHidden = false
        guard let window = mainNavigationController.navigationBar.window else {
            return
        }

        window.rootViewController = loginNavigationController

        window.makeKeyAndVisible()
        
    }
    
    
    func getCoinsArray() {

        coinsArray = []
        coinsArrayClosure([])
        DispatchQueue.global(qos: .userInitiated).async { 
            guard let NM = self.networkManager else {return}
            NM.getCoinsModelsArray(coinsStrings: self.coinsStringsArray)
        }
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
    
// MARK: - Listen Network
    
    func listenNetwork() {
        guard var NM = networkManager else {return}
        NM.giveResponse = {[weak self] array in
            self?.setCoinsArray(coinsArray: array)

        
        }
        
        NM.catchError = { error in
            print(error)
            
        }
    }
    
    private func setCoinsArray(coinsArray: [CoinModel]){
        coinsArrayClosure(coinsArray)
        self.coinsArray = coinsArray
    }
    
   
}



enum PriceChanges {
    case ascendingPrisePerDay
    case decreasePricePerDay
    case ascendingPricePerHour
    case decreasePricePerHour
}
