//
//  DesignSystem+Map.swift
//  Covid-19
//
//  Created by eldin smakic on 11/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI
import GoogleMaps

extension DesignSystem {

    public struct Maps: UIViewRepresentable {

        let serviceCountry = SelectCountryService()

//        @ObservedObject var countryPicker: CountryPicker 

        func makeUIView(context: Self.Context) -> GMSMapView {
           let camera = GMSCameraPosition.camera(withLatitude: 42.5, longitude: 19.3, zoom: 6.0)
           let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            do {
                mapView.mapStyle = try GMSMapStyle(jsonString: jsonStyle!)
            } catch {
                print("error on coordonate JSON")
            }

            return mapView
        }

        func updateUIView(_ mapView: GMSMapView, context: Self.Context) {
//            guard let coordonate = serviceCountry.getCoordonate(fromCountry: countryPicker.countrySelected) else { return }
//
//            mapView.camera = GMSCameraPosition.camera(withLatitude: coordonate.lat, longitude: coordonate.lng, zoom: 6.0)
        }

        var jsonStyle: String? = {
            guard let url = Bundle.main.url(forResource: "styleMap", withExtension: "json")  else { return nil }

            let data = try? String(contentsOf: url)

            return data
        }()

    }
}
