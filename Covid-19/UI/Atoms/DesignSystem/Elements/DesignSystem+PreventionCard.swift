//
//  DesignSystem+PreventionCard.swift
//  Covid-19
//
//  Created by eldin smakic on 08/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI

extension DesignSystem {

    public struct PreventionCard: View
    {
        let imageName: String
        let title: String
        let text: String

        var body: some View
        {
            ZStack(alignment: .leading) {

                HStack {
                    Spacer()

                    VStack(alignment: .leading) {
                        Text(title).font(.system(size: 16, weight: .bold, design: .default))
                        Spacer()
                        Text(text)
                            .font(.system(size: 10))
                        Spacer()
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.size.width/2 + 15, height: nil, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                }
                .frame(height: 134)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .padding(.leading, 56)

                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 175, height: 156, alignment: .leading)
                    .clipped()
                    .offset(y: -2.0)
            }
        }
    }
}
