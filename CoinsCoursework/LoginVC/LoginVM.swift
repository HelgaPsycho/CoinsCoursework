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
    
    var warninngMessageIsShown: Bool {get set}
    
    func checkUser(userModel: UserModel)
}

protocol LoginVMProtocolOut {
    var showMessage: (Bool)->() {get set}
    
}

class LoginVM: LoginVMProtocolIn, LoginVMProtocolOut  {
    
    var messageText = "Email or password is incorrect. Please, try again"
    
    var warninngMessageIsShown: Bool = false {
        didSet {
            showMessage(warninngMessageIsShown)
        }
    }
  
    var showMessage: (Bool)->() = { _ in}
    

    func checkUser(userModel: UserModel) {
        if (userModel.email == "1234") && (userModel.password == "1234") {
            changeRootController()
        } else {
            warninngMessageIsShown = true
            
        }
 }
    
    
    func changeRootController () {
    
        guard let window = loginNavigationController.navigationBar.window else {
            return
        }
        
        window.rootViewController = mainNavigationController
        window.makeKeyAndVisible()

    }
    
}
