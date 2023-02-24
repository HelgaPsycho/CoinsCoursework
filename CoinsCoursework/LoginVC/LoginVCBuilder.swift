//
//  LoginBuilder.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 20.01.2023.
//

import Foundation
import UIKit

protocol LoginVCBuilderProtocol {
    func build(router: RouterLoginProtocol)-> UIViewController
}

final class LoginVCBilder: LoginVCBuilderProtocol {
        
    func build(router: RouterLoginProtocol) -> UIViewController {
        let VC = LoginViewController()
        let VM = LoginVM(router: router)
        VC.viewModel = VM
        
        return VC
    }
    
}
