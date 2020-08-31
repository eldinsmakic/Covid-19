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

struct NumberView: View {
    let number: Int?
    let color: UIColor
    let subtitle: String
    var body: some View {
        VStack {
            CircleCaseUpdateView(color: color)

            Spacer()

            Text("\(number ?? 0)")
                .font(.title)
                .foregroundColor(Color(color))
                .frame(width: 100, height: nil, alignment: .center)
                .animation(.easeOut(duration: 2))

            Spacer()

            Text(subtitle)
                .foregroundColor(.gray)
        }
    }
}

struct CircleCaseUpdateView: View {
    let color: UIColor
    var body: some View {
    return Circle()
             .fill(Color(color.withAlphaComponent(0.2)))
             .overlay(
                  GeometryReader{ geometry in
                    Circle()
                        .fill(Color(self.color))
                        .overlay(
                            GeometryReader{ geometry in
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: geometry.size.width*0.5, height: geometry.size.height*0.5)
                            }
                        )
                        .frame(width: geometry.size.width*0.7, height: geometry.size.height*0.7)
                }
             )
             .frame(width: 40, height: 40, alignment: .center)
    }
}

//struct CaseUpdateViewSwiftUI_Previews: PreviewProvider {
//    let testData = OwidDataManager()
//    static var previews: some View {
//        CaseUpdateViewSwiftUI(owidDataManager: testData)
//    }
//}
