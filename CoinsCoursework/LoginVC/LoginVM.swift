//
//  LoginVM.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 20.01.2023.
//

import Foundation
import UIKit


protocol LoginVMProtocolIn {
    
    var messageText: String {get}
    
    func checkUser(userModel: UserModel)
}

protocol LoginVMProtocolOut {
    var showMessage: (Bool)->() {get set}
    
    var clearTextFieldsClosure: (String) ->() {get set}
    
}

protocol NavigationOfLoginVC {
    func changeRootController ()
}


final class LoginVM: LoginVMProtocolIn, LoginVMProtocolOut, NavigationOfLoginVC {
    
    public var messageText = "Email or password is incorrect. Please, try again"
    
    public func checkUser(userModel: UserModel) {
        if (userModel.email == "1234") && (userModel.password == "1234") {
            clearTextFieldsClosure("")
            changeRootController()
        } else {
            
            showMessage(true)
        }
    }
    
    var clearTextFieldsClosure: (String)->() = { _ in }
    
    var showMessage: (Bool)->() = { _ in}
    
    
    //MARK: - Navigation
    public func changeRootController () {
        
        DispatchQueue.main.async { [self] in
            showMessage(false)
            guard let window = loginNavigationController.navigationBar.window else {
                return
            }
            if let VC = loginNavigationController.viewControllers[0] as? CoinsTableController { VC.getCoinsArray() }
            window.rootViewController = mainNavigationController
            
            window.makeKeyAndVisible()
            
        }
        
    }
    
}
