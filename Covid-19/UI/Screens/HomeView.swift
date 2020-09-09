//
//  HomeView.swift
//  Covid-19
//
//  Created by eldin smakic on 09/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var container: ContainerCovid

    var body: some View {
        VStack {
            TopImageBannerView(
                imageName: "Drcorona",
                imageOffset: 0,
                text: "All you need is to stay at home"
            ).onAppear{
                container.fetchData()
            }

            if container.dataIsLoaded {
                CountryPickerView(container: container)
            }

            CaseUpdateView(owidDataManager: container.owidDataManager)
                .padding(.bottom, 20)
            SpreadOfVirusView()
        }
    }

}
