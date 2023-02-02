//
//  LoginViewController + extension.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 02.02.2023.
//

import Foundation
import UIKit

extension LoginViewController {
    
     func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign In"
        let font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = font
        label.textColor = UIColor.appWhite
        label.textAlignment = .left
        return label
    }
    
    func makeCentralView()-> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor.appWhite
        return view
    }
    
    func makeMessageLabel()-> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = UIColor.red
        label.numberOfLines = 0
        label.textAlignment = .left
        label.isHidden = true
        return label
    }
}
