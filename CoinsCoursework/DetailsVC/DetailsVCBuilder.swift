//
//  DetailsVCBuilder.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 03.02.2023.
//

import Foundation
import UIKit

class DetailsVCBuilder: Builder {
    func build() -> UIViewController {
        let VM = DetailsViewModel()
        let VC = DetailsViewController(nibName: nil, bundle: nil, viewModel: VM)
        
        return VC
    }
    
    
}
