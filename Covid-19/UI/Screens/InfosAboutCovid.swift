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
                imageOffset: 120,
                text: "Get to know About Covid-19."
            )

            VStack {
                DesignSystem.Title(title: "Symptomps")

                HStack {
                    DesignSystem.SymptomCard(imageName: "headache")
                    DesignSystem.SymptomCard(imageName: "caugh")
                    DesignSystem.SymptomCard(imageName: "fever")
                }

                DesignSystem.Title(title: "Prevention")
                    .padding(.top, 20)

                DesignSystem.PreventionCard(imageName: "wash_hands", title: "Wash your hands", text: "Check how many people are effected and how many already died and recovered. It also showing the symptoms of COVID-19 and how you can keep yourself safe.")
                DesignSystem.PreventionCard(imageName: "wash_hands", title: "Wash your hands", text: "Check how many people are effected and how many already died and recovered. It also showing the symptoms of COVID-19 and how you can keep yourself safe.")

            }.background(Color(CGColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 1)))
            .offset(y: -100)
        }
    }
}
