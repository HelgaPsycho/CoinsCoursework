//
//  CoinCellViewModel.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 29.01.2023.
//

import Foundation
import UIKit

final class CoinCellViewModel {
    
    static let shared = CoinCellViewModel()
    
    func getFormattedPrice(price: Double) -> String {
        let formattedString = "    " + String(format: "%.8f", price) + " $"
        return formattedString
    }
    
    func getFormattedPercents(percent: Double) -> String {
        
        let formattedString = "      " + String(format: "%.8f", percent) + " %"
        return formattedString
    }
    
    func getIconForCoin(named: String) -> UIImage? {
        switch named {
        case "Bitcoin":
            return UIImage(named: "btc")
        case "Cardano":
            return UIImage(named: "cardano")
        case "Dogecoin":
            return UIImage(named: "dogecoin")
        case "Ethereum":
            return UIImage(named: "eth")
        case "Polkadot":
            return UIImage(named: "polkadot")
        case "Stellar":
            return UIImage(named: "stellar")
        case "Terra Luna Classic":
            return UIImage(named: "luna")
        case "Tether":
            return UIImage(named: "tether")
        case "TRON":
            return UIImage(named: "tron")
        case "XRP":
            return UIImage(named: "xcp")
        default:
            return UIImage(systemName: "questionmark.square.dashed")
        }
    }
    
    
}
