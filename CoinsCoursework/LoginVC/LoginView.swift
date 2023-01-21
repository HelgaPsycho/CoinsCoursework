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
        stackView.backgroundColor = UIColor.yellow
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        return stackView
    }()

    private var loginTexField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.appLightBeige
        textField.layer.cornerRadius = 5
        textField.placeholder = " Email"

        let leftView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            let image = UIImage(systemName: "envelope.fill")
            let colorConfig = UIImage.SymbolConfiguration(paletteColors: [UIColor.appBeige])
            let confImage = image?.withConfiguration(colorConfig)
            let imageView = UIImageView(image: confImage)
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageView)
            view.heightAnchor.constraint(equalToConstant: 44).isActive = true
            view.widthAnchor.constraint(equalToConstant: 44).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 30).isActive  = true
            imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            return view
        }()

        let image = UIImage(systemName: "envelope.fill")!
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [UIColor.appIndigo])
        let confImage = image.withConfiguration(colorConfig)
        let imageView = UIImageView()
        imageView.image = confImage
        textField.leftView = leftView
        textField.leftViewMode = .always

        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true

        return textField
    }()

    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

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
        stackView.addArrangedSubview(loginTexField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(passwordTextField)
    }

    func setupConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
    
}
