//
//  CoinsTableVCBuilder.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import Foundation
import UIKit

final class CoinsTableVCBuilder: Builder {
    func build() -> UIViewController {
        let VC = CoinsTableController()
        let NM = NetworkManager()
        let VM = CoinsTableViewVM(networkManager: NM)
        VC.viewModel = VM
        
        
        return VC
    }
    
    
}
