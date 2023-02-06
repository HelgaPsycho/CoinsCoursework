//
//  CoinsTableViewVM.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import Foundation
import UIKit

protocol CoinsTableViewProtocolIn {
    
    func getCoinsArray()
    func sortBy(_ changes: PriceChanges)
}

protocol CoinsTableViewProtocolOut {
    
    var coinsArrayClosure: ([CoinModel]) -> (){get set}
    
}

protocol NavigationOfCoincTableVC {
    func navigateToDetailsCV(coin: CoinModel)
    
    func navigateToLoginVC()
    
}

final class CoinsTableViewVM: CoinsTableViewProtocolIn, CoinsTableViewProtocolOut, NavigationOfCoincTableVC {
    
    private let coinsStringsArray: [String] = ["busd", "btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]
    
    private var coinsArray: [CoinModel] = []
    
    public var coinsArrayClosure: ([CoinModel]) -> () = { _ in}
    
    init() {
       listenNetwork()
    }
    
    //MARK: -  CoinsTableViewProtocolIn
    
    public func getCoinsArray() {

        coinsArray = []
        coinsArrayClosure([])
        DispatchQueue.global(qos: .userInitiated).async { 

            NetworkManager.shared.getCoinsModelsArray(coinsStrings: self.coinsStringsArray)
        }
    }

    
    public func sortBy(_ changes: PriceChanges) {
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
    
    private func listenNetwork() {
        NetworkManager.shared.giveResponse = {[weak self] array in
            self?.setCoinsArray(coinsArray: array)

        
        }
        
        NetworkManager.shared.catchError = { error in
            print(error)
            
        }
    }
    
    private func setCoinsArray(coinsArray: [CoinModel]){
        coinsArrayClosure(coinsArray)
        self.coinsArray = coinsArray
    }
    
    //MARK: - Navigation
    
    func navigateToDetailsCV(coin: CoinModel) {
        let detailsVC = DetailsVCBuilder().build() as! DetailsViewController
        detailsVC.viewModel?.coinModel = coin
        mainNavigationController.pushViewController(detailsVC, animated: true)
    }
    
    func navigateToLoginVC(){

            mainNavigationController.isNavigationBarHidden = false
            guard let window = mainNavigationController.navigationBar.window else {
                return
            }

            window.rootViewController = loginNavigationController

            window.makeKeyAndVisible()
    
        
    }
    
   
}



enum PriceChanges {
    case ascendingPrisePerDay
    case decreasePricePerDay
    case ascendingPricePerHour
    case decreasePricePerHour
}
