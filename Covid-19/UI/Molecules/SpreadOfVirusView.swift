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

    @ObservedObject var countryPicker: CountryPicker

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

            Map(coordinateRegion: $countryPicker.countryCoordonate)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 2)
                .frame(width: nil, height: 250, alignment: .leading)
        }
        .padding(.horizontal, 16.5)
    }
}
