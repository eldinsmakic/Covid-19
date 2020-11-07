//
//  TopImageBannerView.swift
//  Covid-19
//
//  Created by eldin smakic on 01/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import SwiftUI

struct TopImageBannerView: View {

    let imageName: String
    let imageOffset: CGFloat
    let imageIsRezisable: Bool
    let text: String

    @State var isDataLoaded: Bool = false

    var repeatingAnimation: Animation {
          Animation
              .linear(duration: 5)
              .repeatForever()
      }

    let colorTop = Color(UIColor(red: 51.0 / 255.0, green: 131.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0).cgColor)
    let colorBottom = Color(UIColor(red: 16.0 / 255.0, green: 33.0 / 255.0, blue: 159.0 / 255.0, alpha: 1.0).cgColor)

    var body: some View {
            ZStack{
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [colorTop, colorBottom]), startPoint: .bottom, endPoint: .top))
                    .clipShape(CustomRectShape())
                    .frame(width: nil, height: nil, alignment: .top)

                if imageIsRezisable {
                    Image(imageName)
                        .offset(x: -40, y: 180 + imageOffset)
                        .clipShape(CustomImageShape())
                } else {
                    Image(imageName)
                        .offset(x: -40, y: 180 + imageOffset)
                        .clipShape(CustomImageShape())
                }

                Image("virus")
                    .onAppear {
                        self.isDataLoaded = true
                    }
                    .offset(x: !isDataLoaded ? -UIScreen.main.bounds.size.width : UIScreen.main.bounds.size.width)
                    .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false))
                    VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text(text)
                                    .lineLimit(2)
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width/2)
                                    .padding(.bottom, 20)
                                    .padding(.trailing, 10)
                            }
                    }.frame(width: UIScreen.main.bounds.width, height: 235)
        }.frame(width: UIScreen.main.bounds.width, height: 235, alignment: .bottom)
        .edgesIgnoringSafeArea(.top)
        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
    }
}

struct CustomRectShape: Shape {

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height - 80))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY - 80), controlPoint: CGPoint(x: rect.maxX/2, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY - 80))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY - 80), controlPoint: CGPoint(x: rect.maxX/2, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.close()
        path.addClip()

        return Path(path.cgPath)
    }
}

struct CustomImageShape: Shape {

    func path(in rect: CGRect) -> Path {
        let maskPath = UIBezierPath()
        maskPath.move(to: CGPoint(x: -40, y: 0))
        maskPath.addLine(to: CGPoint(x: -40, y: rect.height - 50))
        maskPath.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.height - 50), controlPoint: CGPoint(x: rect.maxX/2, y: rect.height - 30))
        maskPath.addLine(to: CGPoint(x: rect.maxX, y: 0))
        maskPath.addLine(to: CGPoint(x: 0, y: 0))
        maskPath.close()
        maskPath.addClip()

        return Path(maskPath.cgPath)
    }
}
