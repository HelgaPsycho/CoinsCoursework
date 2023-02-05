//
//  LoginBuilder.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 20.01.2023.
//

import Foundation
import UIKit

final class LoginVCBilder: Builder {
    
    func build() -> UIViewController {
        let VC = LoginViewController()
        let VM = LoginVM()
        VC.viewModel = VM
        
        return VC
    }
    
}
