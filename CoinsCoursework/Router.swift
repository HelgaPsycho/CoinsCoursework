//
//  Router.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 24.02.2023.
//

import Foundation
import UIKit

protocol RouterMainProrocol {
    
    var navigationController: NavigationController? {get set}
    var builder: LoginVCBuilderProtocol? {get set}
}

protocol RouterLoginProtocol: RouterMainProrocol {
    
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
        let navigationController = NavigationController()
        let builder = CoinsTableVCBuilder()
        let detailBuilder = DetailsVCBuilder()
        let router = RouterMainVC(navigationController: navigationController, builder: builder, detailVCBuilder: detailBuilder)
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
        let navigationController = NavigationController()
        let builder = CoinsTableVCBuilder()
        let router = RouterLogin(navigationController: navigationController, builder: builder as! LoginVCBuilderProtocol)
        router.initLoginNavigationController()
      //  UserDefaults.standard.set(false, forKey: "isAutorized")
        guard let window = navigationController.navigationBar.window else {return}
        window.rootViewController = router.navigationController
        window.makeKeyAndVisible()
    }

    
}
