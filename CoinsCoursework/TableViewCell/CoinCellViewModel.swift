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
    
    public func getFormattedString (string: Double?, symbol: String) -> String{
        
        guard let newString = string else {return  "Value is not avaliable"}
        
        let formattedString = "    " + String(format: "%.6f", newString) + " " + symbol
        return formattedString
    }
    
    
    public func getIconForCoin(named: String?) -> UIImage? {
        
        guard let image = named else {return UIImage(systemName: "questionmark.square.dashed")?.withConfiguration(UIImage.SymbolConfiguration(paletteColors: [.appGreen]))}
        
        return UIImage.getIconForCoin(named: image)
        
    }
    
    
}


