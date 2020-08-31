//
//  CaseUpdateViewSwiftUI.swift
//  Covid-19
//
//  Created by eldin smakic on 30/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI

struct CaseUpdateViewSwiftUI: View {
    @ObservedObject var owidDataManager: OwidDataManager

    var body: some View {
        VStack {
            HStack {
                Text("Case update")
                    .font(.title)
                Spacer()
            }

            HStack {
                Text("Newest update \(owidDataManager.dataCovid?.formatedDate ?? " Fetching..")")
                    .foregroundColor(.gray)
                    .animation(.linear(duration: 2))
                    .transition(.opacity)

                Spacer()

                Text("See details")
                    .foregroundColor(.blue)
            }.padding(.bottom, 10)

            HStack {
                NumberView(
                    number: owidDataManager.dataCovid?.caseUpdate.infected,
                    color: .orange,
                    subtitle: "infected"
                )

                Spacer()

                NumberView(
                    number: owidDataManager.dataCovid?.caseUpdate.death,
                    color: .red,
                    subtitle: "deaths"
                )

                Spacer()

                NumberView(
                    number: owidDataManager.dataCovid?.caseUpdate.recovered,
                    color: .green,
                    subtitle: "Recovered"
                )

            }.frame(width: nil, height: 100)

        }
    }
}
//struct CaseUpdateViewSwiftUI_Previews: PreviewProvider {
//    let testData = OwidDataManager()
//    static var previews: some View {
//        CaseUpdateViewSwiftUI(owidDataManager: testData)
//    }
//}
