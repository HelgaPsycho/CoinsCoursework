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
    
    public func getFormattedPrice(price: Double) -> String {
        let formattedString = "    " + String(format: "%.8f", price) + " $"
        return formattedString
    }
    
    public func getFormattedPercents(percent: Double) -> String {
        
        let formattedString = "      " + String(format: "%.8f", percent) + " %"
        return formattedString
    }
    
    public func getIconForCoin(named: String) -> UIImage? {
        return UIImage.getIconForCoin(named: named)
        }
        
        
    }
    

