//
//  NavigationController.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 20.01.2023.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barStyle = UIBarStyle.default
        navigationBar.tintColor = .appIndigo
        navigationBar.largeContentTitle = "Coins"
        navigationBar.bounds = CGRect(x: 0, y: 0, width: 0, height: 0)
        
    }
    
    deinit {
        print("navigationController deinit")
    }
    

}
