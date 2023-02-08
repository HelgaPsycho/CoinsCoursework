//
//  Double + ext.swift
//  CoinsCoursework
//
//  Created by Ольга Егорова on 08.02.2023.
//

import Foundation

public extension Double {
    
    static var max: Double {
        return Double(greatestFiniteMagnitude)
    }
    
    static var min: Double {
        return Double(-greatestFiniteMagnitude)
    }
}
