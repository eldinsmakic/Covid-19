//
//  CaseUpdateView.swift
//  Covid-19
//
//  Created by eldin smakic on 30/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI

struct CaseUpdateView: View {

    @ObservedObject var owidDataManager: OwidDataManager

    var body: some View {
        VStack {
            HStack {
                DesignSystem.Title(title: "Case update")

                Spacer()
            }
            HStack {
                Text("Newest update")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)

                Text("\(owidDataManager.dataCovid?.formatedDate ?? " Fetching..")")
                    .font(.system(size: 10, weight: .bold, design: .default ))
                    .foregroundColor(.gray)

                Spacer()

                DesignSystem.Button()

            }.padding(.bottom, 10)

            HStack {
                NumberView(
                    totalNumber: owidDataManager.dataCovid?.caseUpdate.totalInfecteds,
                    newNumber: owidDataManager.dataCovid?.caseUpdate.newInfecteds,
                    color: .orange,
                    subtitle: "infected"
                )

                Spacer()

                NumberView(
                    totalNumber: owidDataManager.dataCovid?.caseUpdate.totalDeaths,
                    newNumber: owidDataManager.dataCovid?.caseUpdate.newDeaths,
                    color: .red,
                    subtitle: "deaths"
                )

                Spacer()

                NumberView(
                    totalNumber: owidDataManager.dataCovid?.caseUpdate.totalRecovereds,
                    newNumber: owidDataManager.dataCovid?.caseUpdate.newRecovereds,
                    color: .green,
                    subtitle: "Recovered"
                )

            }
            .frame(width: nil, height: 130)
            .padding(.vertical, 16.5)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
        }
        .padding(.horizontal, 16.5)
    }
}
