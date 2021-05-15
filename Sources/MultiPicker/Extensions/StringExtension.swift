//
//  StringExtension.swift
//
//
//  Created by Anika Seibezeder on 13.05.21.
//

import Foundation

extension String {
    
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}

extension String: Identifiable {
    
    public var id: String { self }
}
