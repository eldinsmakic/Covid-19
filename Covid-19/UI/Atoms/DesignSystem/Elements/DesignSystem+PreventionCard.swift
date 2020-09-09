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
            HStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 175, height: 156, alignment: .leading)
//                    .clipped()
                VStack {
                    Text(title).font(.system(size: 16, weight: .bold, design: .default))
                    Spacer()
                    Text(text)
                    Spacer()
                }
            }
            .frame(width: nil, height: 150, alignment: .leading)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 10)
        }
    }
}
