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
        if (userModel.email == "") && (userModel.password == "") {
            changeRootController()
        } else {
            showMassage()
        }
    }
    
    func changeRootController () {
    
        guard let window = loginNavigationController.navigationBar.window else {
            return
        }
        
        window.rootViewController = navigationContoller
        window.makeKeyAndVisible()

    }
    
    func showMassage() {
        
    }
    
}
