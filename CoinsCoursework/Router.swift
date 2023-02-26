//
//  Router.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 24.02.2023.
//

import Foundation
import UIKit

protocol RouterMainProtocol {
    
    var navigationController: NavigationController? {get set}
    var builder: LoginVCBuilderProtocol? {get set}
}

protocol RouterLoginProtocol: RouterMainProtocol {
    
    func initLoginNavigationController()
    func showMainNavigationController()

}

class RouterLogin: RouterLoginProtocol {
  
    var navigationController: NavigationController?
    
    var builder: LoginVCBuilderProtocol?
    
    init(navigationController: NavigationController, builder:  LoginVCBuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func initLoginNavigationController() {
        if let navigationController = navigationController {
            guard let loginVC = builder?.build(router: self) else {return}
            navigationController.viewControllers = [loginVC]
        }
    }
    
    func showMainNavigationController() {
        guard let window = navigationController?.navigationBar.window else {return}
        let navigationController = Coordinator.shared.mainNavigationController
        let builder = CoinsTableVCBuilder()
        let detailBuilder = DetailsVCBuilder()
        let router = RouterMainVC(navigationController: navigationController, builder: builder, detailVCBuilder: detailBuilder)
        UserDefaults.standard.set(true, forKey: Autorized.keyValue)
        router.initMainNavigationController()
        window.rootViewController = router.navigationController
    }

}

protocol RouterMainVCProtocol {
    
    var navigationController: NavigationController?{get set}
    
    var builder: CoinsTableVCBuilderProtocol? {get set}
    var  detailVCBuilder: DetailsVCBuilder? {get set}
    
    func initMainNavigationController ()
    func showDetaisVC()
    func popToRoot()
    func showLoginNavigationController()
}

class RouterMainVC: RouterMainVCProtocol {
    
    var navigationController: NavigationController?
    
    var builder: CoinsTableVCBuilderProtocol?
    var  detailVCBuilder: DetailsVCBuilder?
    
    init(navigationController: NavigationController, builder: CoinsTableVCBuilder, detailVCBuilder: DetailsVCBuilder){
        self.navigationController = navigationController
        self.builder = builder
        self.detailVCBuilder = detailVCBuilder
    }
    
    func initMainNavigationController() {
        if let navigationController = navigationController {
            guard let mainVC = builder?.build(router: self) else {return}
            //mainVC.getCoinsArray()
            navigationController.viewControllers = [mainVC]
        }
    }
    
    func showDetaisVC() {
        if let navigationController = navigationController {
            guard let detailVC = detailVCBuilder?.build(router: self) else {return}
            navigationController.pushViewController(detailVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    func showLoginNavigationController() {
        navigationController?.isNavigationBarHidden = false
        guard let window = navigationController?.navigationBar.window else {return}
        let loginNavigationController = Coordinator.shared.loginNavigationController
        let builder = LoginVCBilder()
        let loginRouter = RouterLogin(navigationController: loginNavigationController, builder: builder)
        loginRouter.initLoginNavigationController()
        window.rootViewController = Coordinator.shared.loginNavigationController
        window.makeKeyAndVisible()
        UserDefaults.standard.set(false, forKey: Autorized.keyValue)
        
    
    }

    
}
