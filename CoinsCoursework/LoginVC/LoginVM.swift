//
//  LoginVM.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 20.01.2023.
//

import Foundation
import UIKit


protocol LoginVMProtocolIn {
    func checkUser(userModel: UserModel)
}

protocol LoginVMProtocolOut {
    
}

class LoginVM: LoginVMProtocolIn, LoginVMProtocolOut  {
    func checkUser(userModel: UserModel) {
        if (userModel.email == "1234") && (userModel.password == "1234") {
            changeRootController()
        } else {
            showMassage()
        }
    }
    
    func changeRootController () {
    

        guard let window = navigationController.navigationBar.window else {
            return
        }
        
        let newNavigationContoller = NavigationController(rootViewController: CoinsTableVCBuilder().build())
        window.rootViewController = newNavigationContoller
        window.makeKeyAndVisible()

    }
    
    func showMassage() {
        
    }
    
}
