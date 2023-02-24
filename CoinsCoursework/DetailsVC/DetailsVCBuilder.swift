//
//  DetailsVCBuilder.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 03.02.2023.
//

import Foundation
import UIKit

protocol DetailsVCBuilderProtocol {
    func build(router: RouterMainVCProtocol) -> DetailsViewController
}

class DetailsVCBuilder: DetailsVCBuilderProtocol {
    func build(router: RouterMainVCProtocol) -> DetailsViewController {
        let VM = DetailsViewModel(router: router)
        let VC = DetailsViewController(nibName: nil, bundle: nil, viewModel: VM)
        
        return VC
    }
    
    
}
