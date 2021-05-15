//
//  MultiPickerViewModel.swift
//  
//
//  Created by Anika Seibezeder on 13.05.21.
//

import Foundation

class MultiPickerViewModel<SelectionValue>: NSObject where SelectionValue: Hashable {

    // MARK: - Private properties

    private var selection: Set<SelectionValue>
    private var optionToString: (SelectionValue) -> String

    // MARK: - Public properties

    var selectedOptionsText: String {
        switch selection.count {
        case 0:
            return ""
        case 1:
            return optionToString(selection[selection.startIndex])
        default:
            return "\(selection.count) Selected"
        }
    }

    init(selection: Set<SelectionValue>,
         optionToString: @escaping (SelectionValue) -> String) {
        self.selection = selection
        self.optionToString = optionToString
    }
}
