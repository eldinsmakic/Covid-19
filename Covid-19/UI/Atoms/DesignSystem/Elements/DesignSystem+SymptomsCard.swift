//
//  DesignSystem+SymptomsCard.swift
//  Covid-19
//
//  Created by eldin smakic on 08/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI

extension DesignSystem {

    public struct SymptomsCard: View
    {
        let imageName: String

        var body: some View
        {
            VStack {
                Image(imageName)
                Text(imageName)
            }.cornerRadius(15)
            .shadow(radius: 10)
        }
    }
}
