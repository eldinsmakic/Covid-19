//
//  DesignSystem+Title.swift
//  Covid-19
//
//  Created by eldin smakic on 23/07/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI

extension DesignSystem {

    public struct Title: View {

        let title: String

        var body: some View {
            HStack {
                Text(title)
                    .font(.system(size: 19, weight: .bold))
                Spacer()
            }
        }
    }
}
