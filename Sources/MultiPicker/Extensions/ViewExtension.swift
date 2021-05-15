//
//  ViewExtension.swift
//  
//
//  Created by Anika Seibezeder on 13.05.21.
//

import SwiftUI

extension View {
    
    public func multiPickerStyle<Style>(_ style: Style) -> some View where Style: MultiPickerStyle {
        self.environment(\.multiPickerStyle, style)
    }
}
