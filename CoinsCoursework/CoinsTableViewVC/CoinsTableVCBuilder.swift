//
//  CoinsTableVCBuilder.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import Foundation
import UIKit

class CoinsTableVCBuilder: Builder {
    func build() -> UIViewController {
        let VC = CoinsTableController()
        let VM = coinsTableViewVM()
        VC.viewModel = VM
        
        return VC
    }
    
    
}
