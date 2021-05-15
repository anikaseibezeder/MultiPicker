//
//  ContentView.swift
//  Demo
//
//  Created by Anika Seibezeder on 15.05.21.
//

import SwiftUI
import MultiPicker

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
                Section(header: Text("Default Multi Picker Style")) {
                    Toggle("Allows multiple selection", isOn: $allowsMultipleSelectionDefaultStyle)
                    
                    MultiPicker("Options",
                                 selection: $selectedOptionsDefaultStyle,
                                 options: optionsDefaultStyle) {
                        $0
                    }
                    .multiPickerStyle(DefaultMultiPickerStyle(allowsMultipleSelection: allowsMultipleSelectionDefaultStyle))
                }
                
                Section(header: Text("Grid Picker Style")) {
                    Toggle("Allows multiple selection", isOn: $allowsMultipleSelectionGridStyle)
                    
                    MultiPicker("Options",
                                 selection: $selectedOptionsGridStyle,
                                 options: optionsGridStyle) {
                        $0
                    }
                    .multiPickerStyle(GridPickerStyle(columns: 5, allowsMultipleSelection: allowsMultipleSelectionGridStyle))
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
