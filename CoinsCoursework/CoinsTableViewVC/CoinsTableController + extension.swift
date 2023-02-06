//
//  CoinsTableController + extension.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 02.02.2023.
//

import Foundation
import UIKit

extension CoinsTableController {
    
    func makeTopView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func makeExitButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "rectangle.portrait.and.arrow.forward")
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [UIColor.appIndigo])
        let confNormalImage = image?.withConfiguration(UIImage.SymbolConfiguration(scale: .large)).withConfiguration(colorConfig)
        let confHighlImage = image?.withConfiguration(UIImage.SymbolConfiguration(scale: .large)).withConfiguration(colorConfig)
        button.setImage(confNormalImage, for: .normal)
        button.setImage(confHighlImage, for: .highlighted)
        
        return button
    }
    
    func makeSortButton() -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Sort  ", for: .normal)
        button.setTitleColor(UIColor.appIndigo, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        let image = UIImage(systemName: "chevron.down")
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [UIColor.appIndigo])
        let confImage = image?.withConfiguration(UIImage.SymbolConfiguration(scale: .large)).withConfiguration(colorConfig)
        button.setImage(confImage, for: .normal)
        return button
    }
    
    func makeActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .appIndigo
        activityIndicator.hidesWhenStopped = true
        activityIndicator.isHidden =  false
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }
    
    func makeMessageLabel() -> UILabel {
        let label = UILabel()
        label.text = """
        Server is not available now.
        Please try later.
        """
        label.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont.preferredFont(forTextStyle: .headline)
        label.font = font
        label.textColor = .appBeige
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }
}
