//
//  LoginViewController.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 20.01.2023.
//

import UIKit


class LoginViewController: UIViewController  {
     
    var viewModel: (LoginVMProtocolIn & LoginVMProtocolOut)?

    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign In"
        let font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = font
        label.textColor = UIColor.appWhite
        label.textAlignment = .left
        return label
    }()
    
    private var centralView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
    //    view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor.appWhite
        return view
    }()
    
    private var loginView: LoginView?
    
    private var massageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = UIColor.red
        label.text = "Email or password is incorrect. Please, try again"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        return label
    }()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.appBeige
        
        setupVC()
        
    }
    
    
    func setupVC() {
        listenViewModel()
        setHierarchy()
        setConstraints()
        
        setLoginView()
    
    }
    
    func setHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(centralView)
        view.addSubview(massageLabel)
    
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
            centralView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            centralView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            centralView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            centralView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4),
            
            massageLabel.topAnchor.constraint(equalToSystemSpacingBelow: centralView.bottomAnchor, multiplier: 1),
            massageLabel.centerXAnchor.constraint(equalTo: centralView.centerXAnchor),
            massageLabel.widthAnchor.constraint(equalTo: centralView.widthAnchor, multiplier: 2/3)
            
                                    
        ])
    
    }

    
    func setLoginView(){
        
        let loginView = LoginView(frame: .zero)
        loginView.viewModel = viewModel
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        centralView.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: centralView.topAnchor),
            loginView.leftAnchor.constraint(equalTo: centralView.leftAnchor),
            loginView.rightAnchor.constraint(equalTo: centralView.rightAnchor),
            loginView.heightAnchor.constraint(equalTo: centralView.heightAnchor)
        ])
        
    }
    
    func listenViewModel() {
        guard var VM = viewModel else { return }
        VM.showMessage =  {[weak self] isShow in
            self?.showMessage(isShown: isShow)
            
        }
    }
    
    func showMessage(isShown: Bool) {
        massageLabel.isHidden = !isShown
    }
   

}


