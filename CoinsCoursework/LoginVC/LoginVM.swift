//
//  LoginVM.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 20.01.2023.
//

import Foundation


protocol LoginVMProtocolIn {
    func checkUser(userModel: UserModel)
}

protocol LoginVMProtocolOut {
    
}

class LoginVM: LoginVMProtocolIn, LoginVMProtocolOut  {
    func checkUser(userModel: UserModel) {
        //ПРОВЕРКА ПОЛЬЗОВАТЕЛЯ
        pushCoinsTableVC()
    }
    
    func pushCoinsTableVC () {
        navigationController.pushViewController(CoinsTableVCBuilder().build(), animated: true)
    }
}
