//
//  CustomPickerStyles.swift
//  
//
//  Created by Anika Seibezeder on 13.05.21.
//

import Foundation

public protocol CustomPickerStyle {
    var allowsMultipleSelection: Bool { get }
}

public struct DefaultCustomPickerStyle: CustomPickerStyle {
    public let allowsMultipleSelection: Bool
    
    public init(allowsMultipleSelection: Bool = true) {
        self.allowsMultipleSelection = allowsMultipleSelection
    }
}

public struct GridPickerStyle: CustomPickerStyle {
    public let allowsMultipleSelection: Bool
    public let columns: Int
    
    public init(columns: Int = 4, allowsMultipleSelection: Bool = false) {
        self.columns = columns
        self.allowsMultipleSelection = allowsMultipleSelection
    }
}
