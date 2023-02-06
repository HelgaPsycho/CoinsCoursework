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
            guard var coin = coinModel else {return}
            formattedCoinModel.symbol = coin.symbol
            formattedCoinModel.name = coin.name
            formattedCoinModel.priceUsd = String(coin.priceUsd) + " $"
            formattedCoinModel.percentChangeUsdLast1Hour = String(coin.percentChangeUsdLast1Hour) + " %"
            formattedCoinModel.percentChangeUsdLast24Hours = String(coin.percentChangeUsdLast24Hours) + " %"
            formattedCoinModel.countOfActiveAddresses24Hours = String(coin.countOfActiveAddresses24Hours)
            formattedCoinModel.transactionVolume24Hours = String(coin.transactionVolume24Hours)
            formattedCoinModel.allTimesHightPrice = String(coin.allTimesHightPrice) + "$"
            formattedCoinModel.allTimesHightPriceDate = coin.allTimesHightPriceDate.dayText
            formattedCoinModel.percentChangeLast1Week = String(coin.percentChangeLast1Week) + " %"
            formattedCoinModel.percentChangeLast1Month = String(coin.percentChangeLast1Month) + " %"
            formattedCoinModel.percentChangeLast3Month = String(coin.percentChangeLast3Month) + " %"
            formattedCoinModel.percentChangeLast1Year = String(coin.percentChangeLast1Year) + " %"
            
            print ("foramatted coin created")
            catchFormattedCoinModel(formattedCoinModel)
        }
    }
    

}
