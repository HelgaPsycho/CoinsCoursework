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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
