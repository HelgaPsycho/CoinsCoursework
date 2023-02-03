//
//  DetailsViewController + extension.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 03.02.2023.
//

import Foundation
import UIKit

extension DetailsViewController {
    
    func makeTopView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }
    
    func makeTitleLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont.preferredFont(forTextStyle: .title2)
        label.font = font
        label.textColor = .appIndigo
        label.textAlignment = .center
        label.numberOfLines = 1
        label.isHidden = true
        return label
    }
    
    func makeHeaderLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
