//
//  ContentView.swift
//  LengthConversion
//
//  Created by Yhon Vivas on 23-12-25.
//

import SwiftUI

struct ContentView: View {
    @State private var lengthMetricChooseInput = "Meters"
    @State private var lengthMetricChooseOutput = "Meters"
    @State private var userInput = 0.0
    
    let lengthMetricUnits = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    var conversion: Double {
        var result: Double = 0.0
        
        if lengthMetricChooseInput == "Kilometers"{
            result = userInput * 1000
        } else if lengthMetricChooseInput == "Feet"{
            result = userInput * 0.3048
        } else if lengthMetricChooseInput == "Yards"{
            result = userInput * 0.9144
        } else if lengthMetricChooseInput == "Miles"{
            result = userInput * 1609.344
        } else if lengthMetricChooseInput == "Meters" {
            result = userInput * 1
        }
        
        if lengthMetricChooseOutput == "Kilometers"{
            result = result / 1000
        } else if lengthMetricChooseOutput == "Feet"{
            result = result / 0.3048
        } else if lengthMetricChooseOutput == "Yards"{
            result = result / 0.9144
        } else if lengthMetricChooseOutput == "Miles"{
            result = result / 1609.344
        }
        
        
        return result
    }
    
    var body: some View {
        NavigationStack{
            Form {
                
                Section("Input your length and metric unit"){
                    TextField(
                        "Input your length",
                        value: $userInput,
                        format: .number
                    )
                    .keyboardType(.decimalPad)
                    Picker("Metric Unit", selection: $lengthMetricChooseInput) {
                        ForEach(lengthMetricUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Select the unit metric to convert"){
                    Picker("Metric Unit", selection: $lengthMetricChooseOutput) {
                        ForEach(lengthMetricUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section{
                    Text("\(userInput) in \(lengthMetricChooseInput) is \(conversion) in \(lengthMetricChooseOutput)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
