//
//  MainView.swift
//  Covid-19
//
//  Created by eldin smakic on 02/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State var container = ContainerCovid()

    var body: some View {
        TopImageBannerView()

        if container.owidDataManager.dataIsLoaded {
            CountryPickerView(container: container)
        }

        CaseUpdateView(owidDataManager: container.owidDataManager)
        SpreadOfVirusView()
    }
}

class ContainerCovid: ObservableObject {
    var countryPicker = CountryPicker()
    var owidDataManager = OwidDataManager()

    init() {
        owidDataManager.$dataIsLoaded.sink { [self] bool in

            let sorted = self.owidDataManager.dictIsoToCountry.sorted {
                $0 < $1
            }

            for (key, _) in sorted {
                countryPicker.countrys.append(key)
            }
        }
    }
}
