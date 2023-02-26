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
    
    private var router: RouterLoginProtocol?
    
    init(router: RouterLoginProtocol) {
        self.router = router
    }
    
    public var messageText = "Email or password is incorrect. Please, try again"
    
    public func checkUser(userModel: UserModel) {
        if (userModel.email == "1234") && (userModel.password == "1234") {
            //UserDefaults.standard.set(true, forKey: "isAutorized")
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
        
        guard let router = router else {return}
        router.showMainNavigationController()
        
        
    }
    
}
