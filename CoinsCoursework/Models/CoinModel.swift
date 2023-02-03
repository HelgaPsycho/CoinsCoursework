//
//  CoinModel.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 23.01.2023.
//

import Foundation

struct CoinModel {
    
   // static let coinsStringsArray: [String] = ["btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]
    
    //https://data.messari.io/api/v1/assets/tether/metrics
    
    let symbol: String
    let name: String
    let priceUsd: Double
    let percentChangeUsdLast1Hour: Double
    let percentChangeUsdLast24Hours: Double
    let countOfActiveAddresses24Hours: Int
    let transactionVolume24Hours: Double
    let percentChangeLast1Week: Double
    let percentChangeLast1Month: Double
    let percentChangeLast3Month: Double
    let percentChangeLast1Year: Double
    
    init(symbol: String, name: String, priceUsd: Double, percentChangeUsdLast1Hour: Double, percentChangeUsdLast24Hours: Double, countOfActiveAddresses24Hours: Int, transactionVolume24Hours: Double, percentChangeLast1Week: Double, percentChangeLast1Month: Double, percentChangeLast3Month: Double, percentChangeLast1Year: Double) {
        self.symbol = symbol
        self.name = name
        self.priceUsd = priceUsd
        self.percentChangeUsdLast1Hour = percentChangeUsdLast1Hour
        self.percentChangeUsdLast24Hours = percentChangeUsdLast24Hours
        self.countOfActiveAddresses24Hours = countOfActiveAddresses24Hours
        self.transactionVolume24Hours = transactionVolume24Hours
        self.percentChangeLast1Week = percentChangeLast1Week
        self.percentChangeLast1Month = percentChangeLast1Month
        self.percentChangeLast3Month = percentChangeLast3Month
        self.percentChangeLast1Year = percentChangeLast1Year
    }

}


