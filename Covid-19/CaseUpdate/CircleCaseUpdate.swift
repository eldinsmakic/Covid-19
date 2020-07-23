//
//  CicleCaseUpdate.swift
//  Covid-19
//
//  Created by eldin smakic on 05/06/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import UIKit

class CircleCaseUpdate: UIView {
    let shapeLayer = CAShapeLayer()
    let secondShapeLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {

        let center = self.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 7, startAngle: 0, endAngle: (CGFloat(2.0 * Float.pi)), clockwise: true)
        self.shapeLayer.path = circularPath.cgPath
        self.shapeLayer.lineWidth = 4
        self.shapeLayer.fillColor = UIColor.white.cgColor

        let secondCircularPath = UIBezierPath(arcCenter: center, radius: 17, startAngle: 0, endAngle: (CGFloat(2.0 * Float.pi)), clockwise: true)

        self.secondShapeLayer.path = secondCircularPath.cgPath
        self.layer.addSublayer(self.secondShapeLayer)
        self.layer.addSublayer(self.shapeLayer)
    }

    func setColor(color: CGColor)
    {
        self.shapeLayer.strokeColor = color
        self.secondShapeLayer.fillColor = color.copy(alpha: 0.38)!
    }
}
