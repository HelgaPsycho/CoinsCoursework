//
//  CoinModel.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 23.01.2023.
//

import Foundation

struct CoinModel {
    
    static let coinsStringsArray: [String] = ["btc", "eth", "tron", "luna", "polkadot", "dogecoin", "tether", "stellar", "cardano", "xrp"]
    
    //https://data.messari.io/api/v1/assets/tether/metrics
    
    let symbol: String
    let name: String
    let price_usd: Double
    let percentChangeUsdLast1Hour: Double
    let percentChangeUsdLast24Hours: Double
}


