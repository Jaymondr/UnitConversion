//
//  ContentView.swift
//  UnitConversion
//
//  Created by Jaymond Richardson on 6/15/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    @State private var input = 0
    @State private var conversionUnit = "Fahrenheit"
    @FocusState private var inputIsFocused: Bool
    var units = ["Fahrenheit", "Celcius"]
    
    // MARK: - COMPUTED PROPERTIES
    var inputUnit: String {
        return conversionUnit == "Fahrenheit" ? "℃" : "℉"
    }
    
    var output: String {
        if conversionUnit == "Fahrenheit" {
            return String((input * 9/5) + 32)
        } else {
            return String((input - 32) * 5 / 9)
        }
    }
    
    // MARK: - VIEWS
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Input Temperature \(inputUnit)")
                        .padding(.leading, -20)
                }
                
                Section {
                    Text(output)
                    Picker("Input Unit", selection: $conversionUnit) {
                        ForEach(units, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.segmented)
                    
                } header: {
                    Text("Output")
                        .padding(.leading, -20)
                }
            }
            .navigationTitle("Unit Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
