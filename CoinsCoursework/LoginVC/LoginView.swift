//
//  LoginView.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 21.01.2023.
//

import UIKit

class LoginView: UIView {

    var viewModel: (LoginVMProtocolIn & LoginVMProtocolOut)?
    
    var userModel: UserModel = UserModel(email: "", password: "")
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }()

    
    private var emailTextField: UITextField = CustomUITextField(systemImage: "envelope", placeHolder: " Email")
    
    
    private var passwordTextField: UITextField = CustomUITextField(systemImage: "lock.fill", placeHolder: " Password")
  

    private var signInButton: UIButton = CustomButtonWithText(title: "Sign In")

    override init(frame: CGRect) {
        super.init(frame: .zero)
        emailTextField.delegate = self
        passwordTextField.delegate = self
        backgroundColor = .white
        layer.cornerRadius = 20
        
        setupHierarhy()
        setupConstraints()
        setupSignInButton()
        

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupHierarhy(){
        self.addSubview(stackView)
        stackView.addArrangedSubview(emailTextField)
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
            
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.heightAnchor.constraint(equalToConstant:  44),
            signInButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func setupSignInButton() {
        signInButton.addTarget(self, action: #selector(checkUser), for: .touchUpInside)
    }
    
}


//MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        viewModel?.warninngMessageIsShown = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
         changeUserModel()
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if emailTextField.isFirstResponder == true {
            resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }
        else {
           checkUser()
        }
        return true
    }
}

//MARK: - CHECK USER
extension LoginView {
    
    @objc func checkUser () {
        changeUserModel()
        changeUserModel()
        viewModel?.checkUser(userModel: userModel)
        
    }
    
    func changeUserModel() {
        userModel.email = emailTextField.text ?? ""
        userModel.password = passwordTextField.text ?? ""
    }
    
}

//MARK: - LOGIN PASSWORD TEST


