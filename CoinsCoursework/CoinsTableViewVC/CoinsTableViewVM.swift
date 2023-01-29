//
//  CoinsTableViewVM.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import Foundation
import UIKit

protocol CoinsTableViewProtocolIn {
    
    func changeRootController()
}

protocol CoinsTableViewProtocolOut {
    
  
    
}

final class CoinsTableViewVM: CoinsTableViewProtocolIn, CoinsTableViewProtocolOut {
    

    
    func changeRootController () {
    
        guard let window = navigationController.navigationBar.window else {
            return
        }

        window.rootViewController = loginNavigationController
        window.makeKeyAndVisible()

    }
   
}

extension CoinsTableViewVM: NetworkingDelegate {
    func getCoinInformation(_ networking: NetworkManager, coin: CoinModel) {
        DispatchQueue.main.async {
          
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
