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
    let roi_data: RoiData
    let blockchain_stats_24_hours: BlockChainStats24Hours
}

struct MarkedData: Codable {
    let price_usd: Double
    let percent_change_usd_last_1_hour: Double
    let percent_change_usd_last_24_hours: Double
}

struct BlockChainStats24Hours: Codable {
    let count_of_active_addresses: Int
    let transaction_volume: Double
}

struct RoiData: Codable {
    let percent_change_last_1_week: Double
    let percent_change_last_1_month: Double
    let percent_change_last_3_months: Double
    let percent_change_last_1_year: Double
}
