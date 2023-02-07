//
//  Network.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 27.01.2023.
//

import Foundation


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let coinURL = "https://data.messari.io/api/v1/assets/"
    
    var giveResponse: ([CoinModel]) -> () = {_ in}
    
    var catchError: (Error) -> () = {_ in}
    
    func getCoinsModelsArray(coinsStrings: [String]){

        var coinsModelsArray = [CoinModel?]()
        let coinsURLs = coinsStrings.map{coinURL + $0 + "/metrics"}
       
        let group = DispatchGroup()
        
        for string in coinsURLs {
            group.enter()
            DispatchQueue.global(qos: .userInitiated).async {
                self.performRequest(with: string){(result, error) in
                    let coin = result
                
                    coinsModelsArray.append(coin)
                    if error != nil {
                        self.catchError(error!)
                        return
                    }
                    group.leave()
                }
            }
        
        }
        
        group.notify(queue: .main){
            let array = coinsModelsArray.compactMap{$0}
            self.giveResponse(array)
    
        }
    }


    private func performRequest(with urlString: String,
                        completion: @escaping(CoinModel?, Error?) -> ()){
        DispatchQueue.global().async {
            if let url =  URL(string: urlString) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) {(data, response, error) in
                    
                    if error != nil {
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
    
  
private func parseJSON(_ coinData: Data) -> CoinModel? {
    let decoder = JSONDecoder()
    do {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        let decodedData = try decoder.decode(CoinData.self, from: coinData)

        return CoinModel(symbol: decodedData.data.symbol,
                         name: decodedData.data.name,
                         priceUsd: decodedData.data.market_data?.price_usd ?? 0,
                         percentChangeUsdLast1Hour: decodedData.data.market_data?.percent_change_usd_last_1_hour  ?? 0,
                         percentChangeUsdLast24Hours: decodedData.data.market_data?.percent_change_usd_last_24_hours  ?? 0,
                         countOfActiveAddresses24Hours: decodedData.data.blockchain_stats_24_hours?.count_of_active_addresses  ?? 0,
                         transactionVolume24Hours:  decodedData.data.blockchain_stats_24_hours?.transaction_volume  ?? 0,
                         allTimesHightPrice: decodedData.data.all_time_high?.price  ?? 0,
                         allTimesHightPriceDate: decodedData.data.all_time_high?.at ?? Date(timeIntervalSince1970: 0),
                         percentChangeLast1Week: decodedData.data.roi_data?.percent_change_last_1_week  ?? 0,
                         percentChangeLast1Month: decodedData.data.roi_data?.percent_change_last_1_month  ?? 0,
                         percentChangeLast3Month: decodedData.data.roi_data?.percent_change_last_3_months  ?? 0,
                         percentChangeLast1Year: decodedData.data.roi_data?.percent_change_last_1_year  ?? 0)
    }
    catch {
        self.catchError(error)
        return nil
    }
    
}
    
    
}

