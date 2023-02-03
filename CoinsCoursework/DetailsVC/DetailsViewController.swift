//
//  DetailsViewController.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 20.01.2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var viewModel: (DetailsVMProtocolIn & DetailsVMProtocolOut)?
    
    private lazy var topView = makeTopView()

    override func viewDidLoad() {
        super.viewDidLoad()
        mainNavigationController.isNavigationBarHidden = false
        setupVC()

        // Do any additional setup after loading the view.
    }

    private func setupVC() {
        view.backgroundColor = .appBeige
        mainNavigationController.navigationBar.tintColor = .appIndigo
        setupHierarhy()
        setupConstraints()
    }
    
    private func  setupHierarhy() {
        view.addSubview(topView)
        view.addSubview(mainNavigationController.navigationBar)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: mainNavigationController.navigationBar.topAnchor),
            topView.leftAnchor.constraint(equalTo: view.leftAnchor),
            topView.rightAnchor.constraint(equalTo: view.rightAnchor),
            topView.heightAnchor.constraint(equalToConstant: 44)
        ])
     
    }
}
