//
//  Coordinator.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 24.02.2023.
//

import Foundation
protocol CoordinatorProtocol {
    var loginNavigationController: NavigationController {get set}
    var mainNavigationController: NavigationController {get set}
}

class Coordinator: CoordinatorProtocol {
    
    static let shared = Coordinator()
    
    var loginNavigationController = NavigationController()
    var mainNavigationController = NavigationController()
    
}
