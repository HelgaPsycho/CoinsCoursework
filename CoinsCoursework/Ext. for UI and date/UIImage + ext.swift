//
//  UIImage + ext.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 03.02.2023.
//

import Foundation
import UIKit

extension UIImage {
    
    class func getIconForCoin(named: String) -> UIImage? {
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
            return UIImage(systemName: "questionmark.square.dashed")?.withConfiguration(UIImage.SymbolConfiguration(paletteColors: [.appGreen]))
        }
    }
    
    
}
