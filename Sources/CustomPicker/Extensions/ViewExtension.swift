//
//  ViewExtension.swift
//  Decisly
//
//  Created by Anika Seibezeder on 13.05.21.
//

import SwiftUI

extension View {
    
    func customPickerStyle<Style>(_ style: Style) -> some View where Style: CustomPickerStyle {
        self.environment(\.customPickerStyle, style)
    }
}
