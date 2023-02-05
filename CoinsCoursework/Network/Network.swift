//
//  Network.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 27.01.2023.
//

import Foundation


protocol NetworkManagerProtocolOut {
    var giveResponse: ([CoinModel]) -> () {get}
}

class NetworkManager {
    
    let coinURL = "https://data.messari.io/api/v1/assets/"
    
    var coinsModelsArray = [CoinModel?]()
    
    var giveResponse: ([CoinModel]) -> () = {_ in}
    
    func getCoinsModelsArray(coinsStrings: [String]){
        coinsModelsArray = []
        let coinsURLs = coinsStrings.map{coinURL + $0 + "/metrics"}
       
        let group = DispatchGroup()
        
        for string in coinsURLs {
            group.enter()
            performRequest(with: string){(result, error) in
                let coin = result
        
                self.coinsModelsArray.append(coin)
                if error != nil {
                        print ("error with perform request")
                        return
                }
                group.leave()
            
            }
        
        }
        
        group.notify(queue: .main){
        
            self.giveResponse(self.coinsModelsArray.compactMap{$0})
    
        }
    }


    func performRequest(with urlString: String,
                        completion: @escaping(CoinModel?, Error?) -> ()){
        DispatchQueue.global().async {
            if let url =  URL(string: urlString) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) {(data, response, error) in
                    
                    if error != nil {
                        print("error with URLsession")
                        DispatchQueue.global().async { completion(nil, error) }
                 
                    }
                    
                    if let safeData = data {
                    
                         let coin = self.parseJSON(safeData)
                            DispatchQueue.global().async{completion( coin, nil)
                    
                        }
                    }
                    
                }
                task.resume()
            }
            
        }
    }
    
  
func parseJSON(_ coinData: Data) -> CoinModel? {
    let decoder = JSONDecoder()
    do {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let decodedData = try decoder.decode(CoinData.self, from: coinData)

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
    print ("error with parsing")
        return nil
    }
    
}
    
    
}

