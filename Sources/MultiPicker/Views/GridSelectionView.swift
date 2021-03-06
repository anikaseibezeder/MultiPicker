//
//  GridSelectionView.swift
//  
//
//  Created by Anika Seibezeder on 13.05.21.
//

import SwiftUI

public struct GridSelectionView<SelectionValue>: View where SelectionValue: Identifiable & Hashable {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var selection: Set<SelectionValue>
    var multiPickerStyle: GridPickerStyle
    var options: [String: [SelectionValue]]
    var optionToString: (SelectionValue) -> String
    
    private var columns: [GridItem]
    
    init(selection: Binding<Set<SelectionValue>>,
         multiPickerStyle: GridPickerStyle,
         options: [String: [SelectionValue]],
         optionToString: @escaping (SelectionValue) -> String) {
        self._selection = selection
        self.multiPickerStyle = multiPickerStyle
        self.options = options
        self.optionToString = optionToString
        self.columns = [GridItem](repeating: GridItem(.flexible()),
                                  count: multiPickerStyle.columns)
    }
    
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
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
                                if !multiPickerStyle.allowsMultipleSelection {
                                    selection.removeAll()
                                }
                                
                                if let existingIndex = selection.firstIndex(where: { $0.id == option.id }) {
                                    selection.remove(at: existingIndex)
                                } else {
                                    selection.insert(option)
                                }
                                
                                if !multiPickerStyle.allowsMultipleSelection {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            } label: {
                                Text(optionToString(option))
                                    .foregroundColor(Color(.label))
                                    .font(
                                        .title
                                    )
                                    .padding(8)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                                            .fill(selection.contains { $0.id == option.id } ? Color.gray.opacity(0.2) : Color.gray.opacity(0))
                                    )
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct GridSelectionView_Previews: PreviewProvider {
    static let options = [
        "Option 1",
        "Option 2",
        "Option 3"
    ]

    @State static var selectedOptions = Set<String>()
    
    static var previews: some View {
        GridSelectionView(selection: $selectedOptions,
                          multiPickerStyle: GridPickerStyle(),
                          options: ["": options]) {
            $0
        }
    }
}
