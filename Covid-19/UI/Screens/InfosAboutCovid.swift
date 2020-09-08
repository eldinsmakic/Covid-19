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
            TopImageBannerView()

            DesignSystem.Title(title: "Symptomps")

            HStack {
                DesignSystem.SymptomsCard(imageName: "headache")
                DesignSystem.SymptomsCard(imageName: "caugh")
                DesignSystem.SymptomsCard(imageName: "fever")
            }

            DesignSystem.Title(title: "Prevention")
            

        }
    }
}
