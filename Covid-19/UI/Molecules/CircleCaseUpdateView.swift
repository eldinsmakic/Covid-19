//
//  CircleCaseUpdateView.swift
//  Covid-19
//
//  Created by eldin smakic on 31/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI

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
