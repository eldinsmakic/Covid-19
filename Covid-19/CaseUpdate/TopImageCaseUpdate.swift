//
//  TopImageCaseUpdate.swift
//  Covid-19
//
//  Created by eldin smakic on 20/06/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import UIKit

class TopImageCaseUpdate: UIView {

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        let colorTop = UIColor(red: 51.0 / 255.0, green: 131.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 16.0 / 255.0, green: 33.0 / 255.0, blue: 159.0 / 255.0, alpha: 1.0).cgColor
         context.saveGState()
        
        let roundedPath = UIBezierPath()
        roundedPath.move(to: CGPoint(x: 0, y: 0))
        roundedPath.addLine(to: CGPoint(x: 0, y: rect.maxY - 80))
        roundedPath.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY - 80), controlPoint: CGPoint(x: rect.maxX/2, y: rect.maxY))
        roundedPath.addLine(to: CGPoint(x: rect.maxX, y: 0))
        roundedPath.addLine(to: CGPoint(x: 0, y: 0))
        roundedPath.close()
        roundedPath.addClip()

        let color = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: color ,
                                  colors: [colorBottom, colorTop] as CFArray,
                                         locations: [0.0, 1.0])!

        context.drawLinearGradient(gradient, start: CGPoint(x: 0, y: rect.maxY), end: CGPoint(x: rect.maxX, y: 0 ), options: [])

        let maskPath = UIBezierPath()
        maskPath.move(to: CGPoint(x: 40, y: 0))
        maskPath.addLine(to: CGPoint(x: 40, y: bounds.height/2 - 30))
        maskPath.addQuadCurve(to: CGPoint(x: rect.maxX, y: bounds.height/2 - 30), controlPoint: CGPoint(x: rect.maxX/2+40, y: bounds.height/2 + 50))
        maskPath.addLine(to: CGPoint(x: rect.maxX, y: 0))
        maskPath.addLine(to: CGPoint(x: 40, y: 0))
        maskPath.close()
        let maskImage = CAShapeLayer()
        maskImage.path = maskPath.cgPath
        let myLayer = CALayer()
        let myImage = UIImage(named: "Drcorona")?.cgImage
        myLayer.frame = CGRect(x: -40, y: bounds.height/2 - 50, width: bounds.width, height: bounds.height)
        myLayer.masksToBounds = true
        myLayer.contents = myImage
        myLayer.mask = maskImage
        myLayer.contentsGravity = .resizeAspect
        layer.addSublayer(myLayer)
        layer.masksToBounds = true
        context.restoreGState()
        super.draw(rect)

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
