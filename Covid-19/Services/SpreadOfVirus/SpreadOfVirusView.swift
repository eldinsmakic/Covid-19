//
//  SpreadOfVirusView.swift
//  Covid-19
//
//  Created by eldin smakic on 16/06/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import UIKit
import Foundation
import GoogleMaps

class SpreadOfVirusView: UIView {

    var map: GMSMapView!

    override func draw(_ rect: CGRect) {
        self.translatesAutoresizingMaskIntoConstraints = false

        let camera = GMSCameraPosition.camera(withLatitude: 46.227638, longitude: 2.213749, zoom: 6.0)
        self.map = GMSMapView.map(withFrame: self.frame, camera: camera)
        self.map.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(titleLabel)
        self.addSubview(seeDetailsButton)
        self.addSubview(map)
        setupConstraints()

    }

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Spread of Virus"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let seeDetailsButton: UIButton = {
        let button = UIButton()
        button.setTitle("See details", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    func setupConstraints()
    {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),

            seeDetailsButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            seeDetailsButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            seeDetailsButton.widthAnchor.constraint(equalToConstant: 63),
            seeDetailsButton.heightAnchor.constraint(equalToConstant: 30),

            map.leftAnchor.constraint(equalTo: self.leftAnchor),
            map.rightAnchor.constraint(equalTo: self.rightAnchor),
            map.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            map.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
}
