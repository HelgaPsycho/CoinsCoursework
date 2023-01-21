//
//  UIButton + Builder.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 22.01.2023.
//

import Foundation
import UIKit

class CustomButtonWithText: UIButton {
    
    var title: String?
    
    public init(title: String) {
        super.init(frame: .zero)
        self.title = title
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.appIndigo
        layer.cornerRadius = 5
        
        setTitle(title, for: .normal)
        setTitle(title, for: .highlighted)
        setTitleColor(UIColor.appWhite, for: .normal)
        setTitleColor(UIColor.appBeige, for: .highlighted)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
    }
    
}
