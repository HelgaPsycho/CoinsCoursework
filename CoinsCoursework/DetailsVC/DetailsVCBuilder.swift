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
        let VC = DetailsViewController()
        let VM = DetailsViewModel()
        VC.viewModel = VM
        
        return VC
    }
    
    
}
