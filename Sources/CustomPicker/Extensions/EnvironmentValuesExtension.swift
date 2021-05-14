//
//  EnvironmentValuesExtension.swift
//  Decisly
//
//  Created by Anika Seibezeder on 13.05.21.
//

import SwiftUI

private struct CustomPickerStyleKey: EnvironmentKey {
    static let defaultValue: CustomPickerStyle = DefaultCustomPickerStyle()
}

extension EnvironmentValues {
    var customPickerStyle: CustomPickerStyle {
        get {
            self[CustomPickerStyleKey.self]
        }
        set {
            self[CustomPickerStyleKey.self] = newValue
        }
    }
}
