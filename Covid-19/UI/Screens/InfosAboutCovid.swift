//
//  InfosAboutCovid.swift
//  Covid-19
//
//  Created by eldin smakic on 08/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI

struct InfosAboutCovid: View {

    var body: some View {
        VStack {
            TopImageBannerView(
                imageName: "coronadr",
                imageOffset: 0,
                imageIsRezisable: true,
                text: "Get to know About Covid-19."
            )

            VStack {
                DesignSystem.Title(title: "Symptomps")
                    .padding(.leading, 16.5)

                HStack {
                    DesignSystem.SymptomCard(imageName: "headache")
                    DesignSystem.SymptomCard(imageName: "caugh")
                    DesignSystem.SymptomCard(imageName: "fever")
                }

                DesignSystem.Title(title: "Prevention")
                    .padding(.top, 20)
                    .padding(.leading, 16.5)

                DesignSystem.PreventionCard(imageName: "wash_hands", title: "Wash your hands", text: "Check how many people are effected and how many already died and recovered. It also showing the symptoms of COVID-19 and how you can keep yourself safe.")
                    .padding(.horizontal, 16.5)

                DesignSystem.PreventionCard(imageName: "wear_mask", title: "Wear your mask", text: "Masks can help prevent people who wear them from spreading the virus to others. Wearing the mask alone does not protect against VIDOC-19. It should be combined with physical distancing and hand hygiene measures. Follow the advice of local health authorities.")
                    .padding(.horizontal, 16.5)

            }
            .background(Color(red: 0.98, green: 0.98, blue: 0.98))
            .offset(y: -50)
        }
    }
}
