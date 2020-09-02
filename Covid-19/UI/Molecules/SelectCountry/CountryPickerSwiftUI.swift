//
//  CountryPickerSwiftUI.swift
//  Covid-19
//
//  Created by eldin smakic on 01/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI

struct CountryPickerSwiftUI: View {

    @ObservedObject var container: ContainerCovid
    var body: some View {
        Picker("Country", selection: $container.countryPicker.selectedCountry) {
            ForEach(0..<container.countryPicker.countrys.count) { index in
                Text(container.countryPicker.countrys[index]).tag(index)
                }
            }.pickerStyle(InlinePickerStyle())
        .onReceive(container.countryPicker.$selectedCountry) { (index) in
            container.owidDataManager.getData(fromCountry: container.countryPicker.countrys[index], at: Date())
        }
    }
}

class CountryPicker: ObservableObject {
    @Published var countrys: [String] = []
    @Published var selectedCountry: Int = 0
}

class Container: ObservableObject {
    var dataManager = OwidDataManager()
    var countryPicker = CountryPicker()
}
