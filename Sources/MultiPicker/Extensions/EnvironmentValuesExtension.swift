//
//  EnvironmentValuesExtension.swift
//  
//
//  Created by Anika Seibezeder on 13.05.21.
//

import SwiftUI

private struct MultiPickerStyleKey: EnvironmentKey {
    static let defaultValue: MultiPickerStyle = DefaultMultiPickerStyle()
}

extension EnvironmentValues {
    public var multiPickerStyle: MultiPickerStyle {
        get {
            self[MultiPickerStyleKey.self]
        }
        set {
            self[MultiPickerStyleKey.self] = newValue
        }
    }
}
