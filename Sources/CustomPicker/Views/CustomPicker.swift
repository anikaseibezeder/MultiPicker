//
//  CustomPicker.swift
//  
//
//  Created by Anika Seibezeder on 13.05.21.
//

import SwiftUI

struct CustomPicker<SelectionValue>: View where SelectionValue: Identifiable & Hashable {
    @Environment(\.customPickerStyle) var customPickerStyle: CustomPickerStyle
    var label: Text
    var selection: Binding<Set<SelectionValue>>
    var options: [String: [SelectionValue]]
    var optionToString: (SelectionValue) -> String
    private var viewModel: CustomPickerViewModel<SelectionValue>

    init<S>(_ title: S,
            selection: Binding<Set<SelectionValue>>,
            options: [String: [SelectionValue]],
            optionToString: @escaping (SelectionValue) -> String) where S: StringProtocol {
        self.label = Text(title)
        self.selection = selection
        self.options = options
        self.optionToString = optionToString
        self.viewModel = CustomPickerViewModel(selection: selection.wrappedValue,
                                              optionToString: optionToString)
    }
    
    init<S>(_ title: S,
            selection: Binding<Set<SelectionValue>>,
            options: [SelectionValue],
            optionToString: @escaping (SelectionValue) -> String) where S: StringProtocol {
        self.label = Text(title)
        self.selection = selection
        self.options = ["": options]
        self.optionToString = optionToString
        self.viewModel = CustomPickerViewModel(selection: selection.wrappedValue,
                                              optionToString: optionToString)
    }
    
    private var destination: some View {
        Group {
            if let customPickerStyle = customPickerStyle as? GridPickerStyle {
                GridSelectionView(selection: selection,
                                  customPickerStyle: customPickerStyle,
                                  options: options,
                                  optionToString: optionToString)
            } else if let customPickerStyle = customPickerStyle as? DefaultCustomPickerStyle {
                CustomSelectionView(selection: selection,
                                    customPickerStyle: customPickerStyle,
                                    options: options,
                                    optionToString: optionToString)
            } else {
                CustomSelectionView(selection: selection,
                                    customPickerStyle: DefaultCustomPickerStyle(),
                                    options: options,
                                    optionToString: optionToString)
            }
        }
    }

    var body: some View {
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

struct CustomPicker_Previews: PreviewProvider {
    struct IdentifiableString: Identifiable, Hashable {
        let string: String
        var id: String { string }
    }
    
    static let options = [
        "Option 1",
        "Option 2",
        "Option 3"
    ]

    @State static var selectedOptions = Set<IdentifiableString>()

    static var previews: some View {
        NavigationView {
            CustomPicker("Options",
                        selection: $selectedOptions,
                        options: options.map { IdentifiableString(string: $0) }) {
                $0.string
            }
        }
    }
}
