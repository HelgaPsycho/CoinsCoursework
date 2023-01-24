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
        //ПРОВЕРКА ПОЛЬЗОВАТЕЛЯ
        pushCoinsTableVC()
    }
    
    func pushCoinsTableVC () {
    
        navigationController.pushViewController(CoinsTableVCBuilder().build(), animated: true)
        
//        guard let windowScene = navigationController.view.window?.windowScene else {return}
//
//        let window = UIWindow(windowScene: windowScene)
//        let newNavigationContoller = NavigationController(rootViewController: CoinsTableVCBuilder().build())
//
//        window.backgroundColor = UIColor.white
//        window.rootViewController = newNavigationContoller
//        window.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
//        window.windowLevel = .normal + 1
//        window.makeKeyAndVisible()





    }
}
