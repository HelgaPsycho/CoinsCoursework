//
//  DetailsViewController + extension.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 03.02.2023.
//

import Foundation
import UIKit

extension DetailsViewController {
    
    func makeCentralView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appIndigo
        view.layer.cornerRadius = 20
        return view
    }
    
    func makeHorizontalTopStackView() ->UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }
    
    func makeVerticalTopStackView() ->UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }
    
    func makeVerticalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        return stackView
    }
    
    func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }
    
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        let font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = font
        label.textColor = .appIndigo
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }
    
    func makeHeaderLabel(with text: String) -> UILabel {
        let label = UILabel()
        let font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = font
        label.textColor = .appBeige
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = text
        return label
    }
    
    func makeInfoLabel() -> UILabel {
        let label = UILabel()
        let font = UIFont.preferredFont(forTextStyle: .title3)
        label.font = font
        label.textColor = .white
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }
    
}
