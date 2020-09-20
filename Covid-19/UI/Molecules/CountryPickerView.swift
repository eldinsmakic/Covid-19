//
//  CountryPickerView.swift
//  Covid-19
//
//  Created by eldin smakic on 01/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI
import MapKit

struct CountryPickerView: View {

    @ObservedObject var container: ContainerCovid
    @State var selectedCountry: String = "Countrys"

    var body: some View {
        Picker(selectedCountry, selection: $container.countryPicker.selectedCountryIndex) {
            ForEach(0..<container.countryPicker.countrys.count) { index  in
                    Text(container.countryPicker.countrys[index]).tag(index)
                    }
                }.pickerStyle(MenuPickerStyle())
        .frame(width: UIScreen.main.bounds.width, height: 40, alignment: .center)
            .onReceive(container.countryPicker.$selectedCountryIndex) { (index) in
                selectedCountry = container.countryPicker.countrys[index]
                container.owidDataManager.getData(fromCountry: selectedCountry, at: Date())
            }
    }
}

class CountryPicker: ObservableObject {

    @Published var countrys: [String] = []
    @Published var selectedCountryIndex: Int = 0 {
        didSet {
            selectedCountry = countrys[selectedCountryIndex]
            countryCoordonate = changeCoordonate()
        }
    }
    var selectedCountry = ""

    let selectedCountryService = SelectCountryService()

    @Published var countryCoordonate = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    func changeCoordonate() -> MKCoordinateRegion {
        if countrys.isEmpty {
            return countryCoordonate
        } else {
            guard let coordonate = selectedCountryService.getCoordonate(fromCountry: selectedCountry) else {
                return countryCoordonate
            }

            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordonate.lat, longitude: coordonate.lng), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        }

    }

}
