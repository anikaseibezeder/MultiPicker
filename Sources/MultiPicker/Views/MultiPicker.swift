//
//  MultiPicker.swift
//  
//
//  Created by Anika Seibezeder on 13.05.21.
//

import SwiftUI

public struct MultiPicker<SelectionValue>: View where SelectionValue: Identifiable & Hashable {
    @Environment(\.multiPickerStyle) var multiPickerStyle: MultiPickerStyle
    var label: Text
    var selection: Binding<Set<SelectionValue>>
    var options: [String: [SelectionValue]]
    var optionToString: (SelectionValue) -> String
    private var viewModel: MultiPickerViewModel<SelectionValue>

    public init<S>(_ title: S,
            selection: Binding<Set<SelectionValue>>,
            options: [String: [SelectionValue]],
            optionToString: @escaping (SelectionValue) -> String) where S: StringProtocol {
        self.label = Text(title)
        self.selection = selection
        self.options = options
        self.optionToString = optionToString
        self.viewModel = MultiPickerViewModel(selection: selection.wrappedValue,
                                              optionToString: optionToString)
    }
    
    public init<S>(_ title: S,
            selection: Binding<Set<SelectionValue>>,
            options: [SelectionValue],
            optionToString: @escaping (SelectionValue) -> String) where S: StringProtocol {
        self.label = Text(title)
        self.selection = selection
        self.options = ["": options]
        self.optionToString = optionToString
        self.viewModel = MultiPickerViewModel(selection: selection.wrappedValue,
                                              optionToString: optionToString)
    }
    
    private var destination: some View {
        Group {
            if let multiPickerStyle = multiPickerStyle as? GridPickerStyle {
                GridSelectionView(selection: selection,
                                  multiPickerStyle: multiPickerStyle,
                                  options: options,
                                  optionToString: optionToString)
            } else if let multiPickerStyle = multiPickerStyle as? DefaultMultiPickerStyle {
                DefaultMultiSelectionView(selection: selection,
                                           multiPickerStyle: multiPickerStyle,
                                           options: options,
                                           optionToString: optionToString)
            } else {
                DefaultMultiSelectionView(selection: selection,
                                           multiPickerStyle: DefaultMultiPickerStyle(),
                                           options: options,
                                           optionToString: optionToString)
            }
        }
    }

    public var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                label
                Spacer()
                Text(viewModel.selectedOptionsText)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
}

struct MultiPicker_Previews: PreviewProvider {
    static let options = [
        "Option 1",
        "Option 2",
        "Option 3"
    ]

    @State static var selectedOptions = Set<String>()

    static var previews: some View {
        NavigationView {
            MultiPicker("Options",
                        selection: $selectedOptions,
                        options: options) {
                $0
            }
        }
    }
}
