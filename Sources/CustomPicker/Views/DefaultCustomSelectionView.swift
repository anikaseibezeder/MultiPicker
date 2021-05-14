//
//  DefaultCustomSelectionView.swift
//  
//
//  Created by Anika Seibezeder on 13.05.21.
//

import SwiftUI

public struct DefaultCustomSelectionView<SelectionValue>: View where SelectionValue: Identifiable & Hashable {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var selection: Set<SelectionValue>
    var customPickerStyle: DefaultCustomPickerStyle
    var options: [String: [SelectionValue]]
    var optionToString: (SelectionValue) -> String

    public var body: some View {
        List {
            ForEach(options.keys.sorted()) { section in
                Section(header: HStack {
                    Text(section.capitalizeFirstLetter())
                            .foregroundColor(Color(.label))
                            .font(.title3)
                            .fontWeight(.bold)

                    Spacer()
                }) {
                    ForEach(options[section] ?? []) { option in
                        Button {
                            if !customPickerStyle.allowsMultipleSelection {
                                selection.removeAll()
                            }
                            
                            if let existingIndex = selection.firstIndex(where: { $0.id == option.id }) {
                                selection.remove(at: existingIndex)
                            } else {
                                selection.insert(option)
                            }
                            
                            if !customPickerStyle.allowsMultipleSelection {
                                presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            HStack {
                                Text(optionToString(option))
                                    .foregroundColor(Color(.label))

                                Spacer()

                                if selection.contains { $0.id == option.id } {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.accentColor)
                                }
                            }
                        }
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct DefaultCustomSelectionView_Previews: PreviewProvider {
    static let options = [
        "Option 1",
        "Option 2",
        "Option 3"
    ]

    @State static var selectedOptions = Set<String>()

    static var previews: some View {
        DefaultCustomSelectionView(selection: $selectedOptions,
                            customPickerStyle: DefaultCustomPickerStyle(),
                            options: ["": options]) {
            $0
        }
    }
}
