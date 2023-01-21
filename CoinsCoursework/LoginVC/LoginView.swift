//
//  LoginView.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 21.01.2023.
//

import UIKit

class LoginView: UIView {

    var viewModel: (LoginVMProtocolIn & LoginVMProtocolOut)?
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()

    
    private var loginTextField: UITextField = CustomUITextField(systemImage: "envelope", placeHolder: " Email")
    
    
    private var passwordTextField: UITextField = CustomUITextField(systemImage: "lock.fill", placeHolder: " Password")
  

    private var signInButton: UIButton = CustomButtonWithText(title: "Sign In")

    override init(frame: CGRect) {
        super.init(frame: .zero)
        print("LoginView init")
        backgroundColor = .white
        layer.cornerRadius = 20
        
        setupHierarhy()
        setupConstraints()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupHierarhy(){
        self.addSubview(stackView)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(signInButton)
    }

    func setupConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            loginTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.heightAnchor.constraint(equalToConstant:  44),
            signInButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
}


//MARK: UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
}

//MARK: Navigation
extension LoginView {
    
    @objc func moveToCoinsTableViewController () {
        
    }
    
}
