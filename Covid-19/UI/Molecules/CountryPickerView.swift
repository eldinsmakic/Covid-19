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
        Picker(selectedCountry, selection: $container.countryPicker.selectedCountry) {
                ForEach(container.countryPicker.countrys.sorted(by: <), id: \.key) { key, value  in
                    Text(key).tag(value)
                    }
                }.pickerStyle(MenuPickerStyle())
        .frame(width: UIScreen.main.bounds.width, height: 40, alignment: .center)
            .onReceive(container.countryPicker.$selectedCountry) { (index) in
                container.owidDataManager.getData(fromCountry: selectedCountry, at: Date())
                selectedCountry = index
            }
    }
}

class CountryPicker: ObservableObject {

    @Published var countrys: [String: String] = [:]
    @Published var selectedCountry: String = "" {
        didSet {
            countryCoordonate = changeCoordonate()
        }
    }

    let selectedCountryService = SelectCountryService()

    @Published var countryCoordonate = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    func changeCoordonate() -> MKCoordinateRegion {
        if countrys.isEmpty {
            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        } else {
            guard let coordonate = selectedCountryService.getCoordonate(fromCountry: selectedCountry) else {
                return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
            }

            return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: coordonate.lat, longitude: coordonate.lng), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        }

    }

}
