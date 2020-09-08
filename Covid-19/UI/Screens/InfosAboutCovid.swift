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

        TopImageBannerView(
            imageName: "coronadr",
            imageOffset: 120,
            text: "Get to know About Covid-19."
        ).frame(width: nil, height: 350, alignment: .topLeading)

        VStack {
            DesignSystem.Title(title: "Symptomps")

            HStack {
                DesignSystem.SymptomCard(imageName: "headache")
                DesignSystem.SymptomCard(imageName: "caugh")
                DesignSystem.SymptomCard(imageName: "fever")
            }

            DesignSystem.Title(title: "Prevention")
                .padding(.top, 20)
            DesignSystem.PreventionCard(imageName: "wash_hands", title: "Wash your hands", text: "hello world")
            DesignSystem.PreventionCard(imageName: "wash_hands", title: "Wash your hands", text: "hello world")
        }.background(Color(CGColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 1)))
        .offset(y: -100)
    }
}
