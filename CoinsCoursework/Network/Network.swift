//
//  Network.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 27.01.2023.
//

import Foundation

protocol NetworkingDelegate {
    
    func getCoinInformation(_ networking: NetworkManager, coin: CoinModel)
    func didFailWithError(error: Error)
    
}

struct NetworkManager {
    
    var delegate: NetworkingDelegate?
    
//    func getCoinData(named: String, compl: @escaping (CoinModel) -> Void) {
////        DispatchQueue.background.async {
////            fetchCoin(coin: named)
////        }
//    }
    
    let coinURL = "https://data.messari.io/api/v1/assets/"
    // https://data.messari.io/api/v1/assets/«тут монета»/metrics
    
    func fetchCoin(coin: String) {
        let urlString = "\(coinURL)\(coin)/metrics"
        performRequest(with: urlString)
    }
    func performRequest(with urlString: String){
        if let url =  URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                 //   let jsonString = String(data: safeData, encoding: .utf8)
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.getCoinInformation(self, coin: coin)
                    }
                }
               
            }
            task.resume()
        }
        
    }
    
  
func parseJSON(_ coinData: Data) -> CoinModel? {
    let decoder = JSONDecoder()
    do {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let decodedData = try decoder.decode(CoinData.self, from: coinData)
        print(decodedData.data.symbol)
        return CoinModel(symbol: decodedData.data.symbol,
                         name: decodedData.data.name,
                         priceUsd: decodedData.data.market_data.price_usd,
                         percentChangeUsdLast1Hour: decodedData.data.market_data.percent_change_usd_last_1_hour,
                         percentChangeUsdLast24Hours: decodedData.data.market_data.percent_change_usd_last_24_hours,
                         countOfActiveAddresses24Hours: decodedData.data.blockchain_stats_24_hours.count_of_active_addresses,
                         transactionVolume24Hours: decodedData.data.blockchain_stats_24_hours.transaction_volume,
                         allTimesHightPrice: decodedData.data.all_time_high.price,
                         allTimesHightPriceDate: decodedData.data.all_time_high.at,
                         percentChangeLast1Week: decodedData.data.roi_data.percent_change_last_1_week,
                         percentChangeLast1Month: decodedData.data.roi_data.percent_change_last_1_month,
                         percentChangeLast3Month: decodedData.data.roi_data.percent_change_last_3_months,
                         percentChangeLast1Year: decodedData.data.roi_data.percent_change_last_1_year)
    }
    catch {
        delegate?.didFailWithError(error: error)
        return nil
    }
    
}
    
    
}

