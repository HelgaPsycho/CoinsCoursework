//
//  textFieldBuilder.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 21.01.2023.
//

import Foundation
import UIKit

class CustomUITextField: UITextField {
    
    var systemImage: String?
    
    public init(systemImage: String?, placeHolder: String?) {
        super.init(frame: .zero)
        self.placeholder = placeHolder ?? ""
        self.systemImage = systemImage
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(){
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.appLightBeige
        layer.cornerRadius = 5
        textColor = .appIndigo
       // attributedPlaceholder.
        returnKeyType = .done
        guard let imageString = systemImage else {
            return
        }
        setupLeftView(systemImage: imageString)
        
    }
    
    func setupLeftView(systemImage: String) {
        let leftView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            let image = UIImage(systemName: systemImage)
            let colorConfig = UIImage.SymbolConfiguration(paletteColors: [UIColor.appBeige])
            let confImage = image?.withConfiguration(UIImage.SymbolConfiguration(scale: .medium)).withConfiguration(colorConfig)
            let imageView = UIImageView(image: confImage)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageView)
            view.heightAnchor.constraint(equalToConstant: 44).isActive = true
            view.widthAnchor.constraint(equalToConstant: 44).isActive = true
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            return view
        }()
      
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
}

   
