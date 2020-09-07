//
//  NumberView.swift
//  Covid-19
//
//  Created by eldin smakic on 31/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI

struct NumberView: View {
    let totalNumber: Double?
    let newNumber: Double?
    let color: UIColor
    let subtitle: String
    var body: some View {
        VStack {
            CircleCaseUpdateView(color: color)

            Spacer()

            Text("\(totalNumber != nil ? Int(totalNumber!) : 0)")
                .font(.title)
                .foregroundColor(Color(color))
                .frame(width: 100, height: nil, alignment: .center)
                .animation(.easeOut(duration: 2))
            if newNumber != nil {
                Text("(+ \(Int(newNumber!)))")
                    .font(.subheadline)
                    .foregroundColor(Color(color))
            }
            Spacer()

            Text(subtitle)
                .foregroundColor(.gray)
        }
    }
}
