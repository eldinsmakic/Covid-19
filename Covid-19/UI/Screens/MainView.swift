//
//  MainView.swift
//  Covid-19
//
//  Created by eldin smakic on 02/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct MainView: View {

    @StateObject var container = ContainerCovid()

    var body: some View {

        TabView {

            HomeView(container: container)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            InfosAboutCovid()
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text("Infos")
                }
        }
    }
}

class ContainerCovid: ObservableObject {

    var countryPicker = CountryPicker()
    var owidDataManager = OwidDataManager()

    var cancelable: AnyCancellable?

    @Published var dataIsLoaded = false

    func fetchData()
    {
        cancelable = owidDataManager.loadData()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { _ in
            }, receiveValue: { (datas) in
                    self.owidDataManager.datas = datas

                    let sorted = self.owidDataManager.dictIsoToCountry.sorted {
                        $0 < $1
                    }

                    for (key, _) in sorted {
                        self.countryPicker.countrys.append(key)
                    }
                    self.owidDataManager.dataIsLoaded = true
                    self.dataIsLoaded = true
            })
    }
}
