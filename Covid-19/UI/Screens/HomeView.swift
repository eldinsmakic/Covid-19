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
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                TopImageBannerView(
                    imageName: "Drcorona",
                    imageOffset: 0,
                    imageIsRezisable: false,
                    text: "All you need is to stay at home"
                ).onAppear{
                    container.fetchData()
                }
                VStack {
                    if container.dataIsLoaded {
                        CountryPickerView(container: container)
                            .padding(.top, 10)
                    }

                    CaseUpdateView(owidDataManager: container.owidDataManager)
                        .padding([.leading, .trailing, .bottom], 16.5)

                    SpreadOfVirusView(countryPicker: container.countryPicker)
                        .padding(16.5)
                }
                .offset(y: -50)
            }
            .background(Color(red: 0.98, green: 0.98, blue: 0.98))
        }.edgesIgnoringSafeArea(.top)
    }

}
