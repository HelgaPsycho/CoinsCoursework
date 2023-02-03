//
//  DetailsViewController + extension.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 03.02.2023.
//

import Foundation
import UIKit

extension DetailsViewController {
    
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
        stackView.backgroundColor = .yellow
        stackView.distribution = .fillEqually
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
        label.numberOfLines = 1
        return label
    }
    
    func makeHeaderLabel() -> UILabel {
        let label = UILabel()
     //   label.translatesAutoresizingMaskIntoConstraints = false

        let font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.font = font
        label.textColor = .appGreen
        label.textAlignment = .center
        label.numberOfLines = 1
        label.isHidden = true
        return label
    }
    
    func makeInfoLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont.preferredFont(forTextStyle: .headline)
        label.font = font
        label.textColor = .appIndigo
        label.textAlignment = .center
        label.numberOfLines = 1
        label.isHidden = true
        return label
    }
    
}
