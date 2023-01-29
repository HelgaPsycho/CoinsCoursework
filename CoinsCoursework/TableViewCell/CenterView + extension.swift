//
//  CenterView + extension.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 27.01.2023.
//

import Foundation
import UIKit

extension CenterView {
    func makeActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }
    
    func makeIconView() -> UIView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    func makeVerticalStackView() ->UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        return stackView
    }
    
    func makeTitleLabel()-> UILabel  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = font
        label.textColor = .white
        label.textAlignment = .left
        return label
    }
    
    func makeBodyLabel()-> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont.preferredFont(forTextStyle: .body)
        label.font = font
        label.textColor = .white
        label.textAlignment = .right
        return label
    }
    
    
}
