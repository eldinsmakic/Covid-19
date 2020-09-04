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
        TopImageBannerView().onAppear{
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

class ContainerCovid: ObservableObject {
    var countryPicker = CountryPicker()
    var owidDataManager = OwidDataManager()
    @Published var dataIsLoaded = false
    var cancelable: AnyCancellable?

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
