//
//  formattedCoinModel.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 06.02.2023.
//

import Foundation

struct FormatedCoinModel {
    var symbol: String = ""
    var name: String = ""
    
    var priceUsd: String = ""
    var percentChangeUsdLast1Hour: String = ""
    var percentChangeUsdLast24Hours: String = ""
    
    var countOfActiveAddresses24Hours: String = ""
    var transactionVolume24Hours: String = ""
    
    var allTimesHightPrice: String = ""
    var allTimesHightPriceDate: String = ""
    
    var percentChangeLast1Week: String = ""
    var percentChangeLast1Month: String = ""
    var percentChangeLast3Month: String = ""
    var percentChangeLast1Year: String = ""
}
