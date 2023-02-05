//
//  CoinModel.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 23.01.2023.
//

import Foundation

struct CoinModel {
    
    let symbol: String
    let name: String
    
    let priceUsd: Double
    let percentChangeUsdLast1Hour: Double
    let percentChangeUsdLast24Hours: Double
    
    let countOfActiveAddresses24Hours: Int
    let transactionVolume24Hours: Double
    
    let allTimesHightPrice: Double
    let allTimesHightPriceDate: Date
    
    let percentChangeLast1Week: Double
    let percentChangeLast1Month: Double
    let percentChangeLast3Month: Double
    let percentChangeLast1Year: Double
    
    init(symbol: String = "",
         name: String = "",
         priceUsd: Double = 0.0,
         percentChangeUsdLast1Hour: Double = 0.0,
         percentChangeUsdLast24Hours: Double = 0.0,
         countOfActiveAddresses24Hours: Int = 0,
         transactionVolume24Hours: Double = 0.0,
         allTimesHightPrice: Double = 0.0,
         allTimesHightPriceDate: Date = Date(timeIntervalSince1970: 0),
         percentChangeLast1Week: Double = 0.0,
         percentChangeLast1Month: Double = 0.0,
         percentChangeLast3Month: Double = 0.0,
         percentChangeLast1Year: Double = 0.0) {
        
        self.symbol = symbol
        self.name = name
        
        self.priceUsd = priceUsd
        self.percentChangeUsdLast1Hour = percentChangeUsdLast1Hour
        self.percentChangeUsdLast24Hours = percentChangeUsdLast24Hours
        
        self.countOfActiveAddresses24Hours = countOfActiveAddresses24Hours
        self.transactionVolume24Hours = transactionVolume24Hours
        
        self.allTimesHightPrice = allTimesHightPrice
        self.allTimesHightPriceDate = allTimesHightPriceDate
        
        self.percentChangeLast1Week = percentChangeLast1Week
        self.percentChangeLast1Month = percentChangeLast1Month
        self.percentChangeLast3Month = percentChangeLast3Month
        self.percentChangeLast1Year = percentChangeLast1Year
    }

}


