//
//  LoginViewController.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 20.01.2023.
//

import UIKit


class LoginViewController: UIViewController  {
     
    var viewModel: (LoginVMProtocolIn & LoginVMProtocolOut)?

    
    private lazy var titleLabel: UILabel = makeTitleLabel()
    private lazy var centralView: UIView = makeCentralView()
    private var loginView: LoginView?
    private lazy var massageLabel: UILabel = makeMessageLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupVC()
        
    }
    
    
    private func setupVC() {
        view.backgroundColor = UIColor.appBeige
        massageLabel.text = viewModel?.messageText
        listenViewModel()
        setHierarchy()
        setConstraints()
        
        setLoginView()
    
    }
    
    private func setHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(centralView)
        view.addSubview(massageLabel)
    
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            centralView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            centralView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            centralView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            //centralView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 1/4),
            
            massageLabel.topAnchor.constraint(equalToSystemSpacingBelow: centralView.bottomAnchor, multiplier: 1),
            massageLabel.centerXAnchor.constraint(equalTo: centralView.centerXAnchor),
            massageLabel.widthAnchor.constraint(equalTo: centralView.widthAnchor, multiplier: 2/3)
            
                                    
        ])
    
    }

    
    private func setLoginView(){
        
        let loginView = LoginView(frame: .zero)
        loginView.viewModel = viewModel
        loginView.listenViewModel()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        centralView.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: centralView.topAnchor),
            loginView.leftAnchor.constraint(equalTo: centralView.leftAnchor),
            loginView.rightAnchor.constraint(equalTo: centralView.rightAnchor),
            loginView.heightAnchor.constraint(equalTo: centralView.heightAnchor)
        ])
        
    }
    
    //MARK: - ViewModel methods
    
    private func listenViewModel() {
        guard var VM = viewModel else { return }
        VM.showMessage =  {[weak self] isShow in
        
            self?.massageLabel.isHidden = !isShow
            
        }
    }

}


