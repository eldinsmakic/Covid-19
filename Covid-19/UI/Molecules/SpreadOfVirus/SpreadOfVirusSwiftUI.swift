//
//  SpreadOfVirusSwiftUI.swift
//  Covid-19
//
//  Created by eldin smakic on 31/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import MapKit
import SwiftUI

struct SpreadOfVirusSwiftUI: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        VStack {
            HStack {
                Text("Spread of Virus")
                    .font(.system(size: 19, weight: .bold))
                Spacer()
            }
            HStack {
                Spacer()

                Text("See details")
                    .foregroundColor(.blue)
            }.padding(.bottom, 10)
            if #available(iOS 14.0, *) {
                Map(coordinateRegion: $region)
            } else {
                Text("need ios14 for map")
            }
        }
    }
}
