//
//  SpreadOfVirusView.swift
//  Covid-19
//
//  Created by eldin smakic on 31/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import MapKit
import SwiftUI

struct SpreadOfVirusView: View {

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

                DesignSystem.Button()

            }.padding(.bottom, 10)

            DesignSystem.Maps()
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 2)
                .frame(width: nil, height: 250, alignment: .leading)
        }
        .padding(.horizontal, 16.5)
    }
}
