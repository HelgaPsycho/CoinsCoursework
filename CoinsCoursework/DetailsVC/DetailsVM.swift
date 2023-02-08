//
//  DetailsVM.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 03.02.2023.
//

import Foundation
import UIKit

protocol DetailsVMProtocolIn {
    var coinModel: CoinModel? { get set }
    
}

protocol DetailsVMProtocolOut {
    var catchFormattedCoinModel: (FormatedCoinModel)->(){get set}
}



final class DetailsViewModel: DetailsVMProtocolIn, DetailsVMProtocolOut{
    
    var catchFormattedCoinModel: (FormatedCoinModel) -> () = {_ in}
    
    var coinModel: CoinModel? {

        didSet { var formattedCoinModel = FormatedCoinModel()
            guard let coin = coinModel else {return}
            formattedCoinModel.symbol = coin.symbol
            formattedCoinModel.name = coin.name
            formattedCoinModel.priceUsd = getString(value: coin.priceUsd, symbol: "$")
            formattedCoinModel.percentChangeUsdLast1Hour = getString(value: coin.percentChangeUsdLast1Hour, symbol: "%")
            formattedCoinModel.percentChangeUsdLast24Hours = getString(value: coin.percentChangeUsdLast24Hours, symbol: "%")
            formattedCoinModel.countOfActiveAddresses24Hours = getString(value: coin.countOfActiveAddresses24Hours, symbol: "")
            formattedCoinModel.transactionVolume24Hours = getString(value: coin.transactionVolume24Hours, symbol: "")
            formattedCoinModel.allTimesHightPrice = getString(value: coin.allTimesHightPrice, symbol: "$")
            formattedCoinModel.allTimesHightPriceDate = getDateString(date: coin.allTimesHightPriceDate)
            formattedCoinModel.percentChangeLast1Week = getString(value: coin.percentChangeLast1Week, symbol: "%")
            formattedCoinModel.percentChangeLast1Month = getString(value: coin.percentChangeLast1Month, symbol: "%")
            formattedCoinModel.percentChangeLast3Month = getString(value: coin.percentChangeLast3Month, symbol: "%")
            formattedCoinModel.percentChangeLast1Year = getString(value: coin.percentChangeLast1Year, symbol: "%")
            catchFormattedCoinModel(formattedCoinModel)
        }
    }
    

    func getString <T> (value: T?, symbol: String)-> String {
        guard let startValue = value else {
            return "    Value is not avaliable now"
        }
        
        let  newString = "    " + String(describing: startValue) + " " + symbol
        return newString
    }
    
    func getDateString (date: Date?) -> String {
        guard var dateString = date else {return "    Value is not avaliable now"}
        return "     " + dateString.dayText
    }
    
}
