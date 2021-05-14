//
//  CustomPickerStyles.swift
//  
//
//  Created by Anika Seibezeder on 13.05.21.
//

import Foundation

protocol CustomPickerStyle {
    var allowsMultipleSelection: Bool { get }
}

struct DefaultCustomPickerStyle: CustomPickerStyle {
    let allowsMultipleSelection: Bool
    
    init(allowsMultipleSelection: Bool = true) {
        self.allowsMultipleSelection = allowsMultipleSelection
    }
}

struct GridPickerStyle: CustomPickerStyle {
    let allowsMultipleSelection: Bool
    let columns: Int
    
    init(columns: Int = 4, allowsMultipleSelection: Bool = false) {
        self.columns = columns
        self.allowsMultipleSelection = allowsMultipleSelection
    }
}
