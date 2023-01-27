//
//  Network.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 27.01.2023.
//

import Foundation

protocol NetworkingDelegate {
    
    func getCoinInformation(_ networking: Networking, coin: CoinModel)
    func didFailWithError(error: Error)
    
}

struct Networking {
    
    static let shared = Networking()
    
    func getCoinData(named: String, compl: @escaping (CoinModel) -> Void) {
//        DispatchQueue.background.async {
//            fetchCoin(coin: named)
//        }
    }
    
    let coinURL = "https://data.messari.io/api/v1/assets/"
    // https://data.messari.io/api/v1/assets/«тут монета»/metrics
    
    var delegate: NetworkingDelegate?
    
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
        let decodedData = try decoder.decode(CoinData.self, from: coinData)
        let symbol = decodedData.data.symbol
        let name = decodedData.data.name
        let priceUsd = decodedData.data.market_data.price_usd
        let percentChangeUsdLast1Hour = decodedData.data.market_data.percent_change_usd_last_1_hour
        let percentChangeUsdLast24Hours = decodedData.data.market_data.percent_change_usd_last_24_hours
        
        
        return CoinModel(symbol: symbol, name: name, priceUsd: priceUsd, percentChangeUsdLast1Hour: percentChangeUsdLast1Hour, percentChangeUsdLast24Hours: percentChangeUsdLast24Hours)
    }
    catch {
        delegate?.didFailWithError(error: error)
        return nil
    }
    
}
    
    
}
