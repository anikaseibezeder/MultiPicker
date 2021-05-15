//
//  ContentView.swift
//  Demo
//
//  Created by Anika Seibezeder on 15.05.21.
//

import SwiftUI
import CustomPicker

struct ContentView: View {
    @State private var selectedOptionsDefaultStyle = Set<String>()
    @State private var selectedOptionsGridStyle = Set<String>()
    
    @State private var allowsMultipleSelectionDefaultStyle = false
    @State private var allowsMultipleSelectionGridStyle = false
    
    private let optionsDefaultStyle = ["Option 1", "Option 2"]
    private let optionsGridStyle = ["😃", "😄", "😁", "😆", "😅"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("DefaultMultiPickerStyle")) {
                    Toggle("Allows multiple selection", isOn: $allowsMultipleSelectionDefaultStyle)
                    
                    CustomPicker("Options",
                                 selection: $selectedOptionsDefaultStyle,
                                 options: optionsDefaultStyle) {
                        $0
                    }
                    .customPickerStyle(DefaultCustomPickerStyle(allowsMultipleSelection: allowsMultipleSelectionDefaultStyle))
                }
                
                Section(header: Text("GridPickerStyle")) {
                    Toggle("Allows multiple selection", isOn: $allowsMultipleSelectionGridStyle)
                    
                    CustomPicker("Options",
                                 selection: $selectedOptionsGridStyle,
                                 options: optionsGridStyle) {
                        $0
                    }
                    .customPickerStyle(GridPickerStyle(columns: 5, allowsMultipleSelection: allowsMultipleSelectionGridStyle))
                }
            }
            .navigationTitle("MultiPicker Demo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
