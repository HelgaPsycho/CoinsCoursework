//
//  CoinData.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 23.01.2023.
//

import Foundation

struct CoinData: Codable {
    
    let data: NameData
}

struct NameData: Codable {
    let symbol: String
    let name: String
    let market_data: MarkedData
}

struct MarkedData: Codable {
    let price_usd: Double
    let percent_change_usd_last_1_hour: Double
    let percent_change_usd_last_24_hours: Double
}
