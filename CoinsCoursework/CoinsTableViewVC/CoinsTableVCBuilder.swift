//
//  CoinsTableVCBuilder.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import Foundation
import UIKit

protocol CoinsTableVCBuilderProtocol {
    func build(router: RouterMainVCProtocol)-> UIViewController
}

final class CoinsTableVCBuilder: CoinsTableVCBuilderProtocol {
  
    
    func build(router: RouterMainVCProtocol) -> UIViewController {
        let VC = CoinsTableController()
        let VM = CoinsTableViewVM(router: router)
        VC.viewModel = VM 
        
        return VC
    }
    
    
}
