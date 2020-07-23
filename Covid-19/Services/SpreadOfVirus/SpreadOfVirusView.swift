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

class SpreadOfVirusView: UIViewController {
    let path = "Services/SpreadOfVirus"
    var map: GMSMapView!

    override func viewDidLoad() {
        view.translatesAutoresizingMaskIntoConstraints = false
        let camera = GMSCameraPosition.camera(withLatitude: 46.227638, longitude: 2.213749, zoom: 3.8)
        self.map = GMSMapView.map(withFrame: view.frame, camera: camera)
        self.map.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        view.addSubview(seeDetailsButton)
        view.addSubview(map)
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        do {
             self.map.mapStyle = try GMSMapStyle(jsonString: jsonStyle)
             // Set the map style by passing the URL of the local file.
             if let styleURL = Bundle.main.url(forResource: "\(path)/style_map", withExtension: "json") {
                self.map.mapStyle = try GMSMapStyle(jsonString: jsonStyle)
             } else {
               NSLog("Unable to find style.json")
             }
           } catch {
             NSLog("One or more of the map styles failed to load. \(error)")
        }

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

    let jsonStyle = """
    [
      {
        "elementType": "labels",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#8ec3b9"
          }
        ]
      },
      {
        "featureType": "administrative",
        "elementType": "geometry",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "administrative.country",
        "stylers": [
          {
            "color": "#000000"
          },
          {
            "weight": 8
          }
        ]
      },
      {
        "featureType": "administrative.land_parcel",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "administrative.land_parcel",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#64779e"
          }
        ]
      },
      {
        "featureType": "administrative.neighborhood",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "landscape.natural",
        "stylers": [
          {
            "color": "#347fca"
          }
        ]
      },
      {
        "featureType": "poi",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "poi",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#283d6a"
          }
        ]
      },
      {
        "featureType": "poi",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#6f9ba5"
          }
        ]
      },
      {
        "featureType": "poi",
        "elementType": "labels.text.stroke",
        "stylers": [
          {
            "color": "#1d2c4d"
          }
        ]
      },
      {
        "featureType": "poi.park",
        "stylers": [
          {
            "color": "#871e24"
          }
        ]
      },
      {
        "featureType": "poi.park",
        "elementType": "geometry.fill",
        "stylers": [
          {
            "color": "#023e58"
          }
        ]
      },
      {
        "featureType": "poi.park",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#3C7680"
          }
        ]
      },
      {
        "featureType": "poi.sports_complex",
        "stylers": [
          {
            "color": "#eef6ff"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#304a7d"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "labels.icon",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#98a5be"
          }
        ]
      },
      {
        "featureType": "road",
        "elementType": "labels.text.stroke",
        "stylers": [
          {
            "color": "#1d2c4d"
          }
        ]
      },
      {
        "featureType": "road.highway",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#2c6675"
          }
        ]
      },
      {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
          {
            "color": "#255763"
          }
        ]
      },
      {
        "featureType": "road.highway",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#b0d5ce"
          }
        ]
      },
      {
        "featureType": "road.highway",
        "elementType": "labels.text.stroke",
        "stylers": [
          {
            "color": "#023e58"
          }
        ]
      },
      {
        "featureType": "transit",
        "stylers": [
          {
            "visibility": "off"
          }
        ]
      },
      {
        "featureType": "transit",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#98a5be"
          }
        ]
      },
      {
        "featureType": "transit",
        "elementType": "labels.text.stroke",
        "stylers": [
          {
            "color": "#1d2c4d"
          }
        ]
      },
      {
        "featureType": "transit.line",
        "elementType": "geometry.fill",
        "stylers": [
          {
            "color": "#283d6a"
          }
        ]
      },
      {
        "featureType": "transit.station",
        "elementType": "geometry",
        "stylers": [
          {
            "color": "#3a4762"
          }
        ]
      },
      {
        "featureType": "water",
        "stylers": [
          {
            "color": "#eaebea"
          },
          {
            "visibility": "on"
          }
        ]
      },
      {
        "featureType": "water",
        "elementType": "geometry.fill",
        "stylers": [
          {
            "color": "#f9faf9"
          }
        ]
      },
      {
        "featureType": "water",
        "elementType": "labels.text",
        "stylers": [
          {
            "color": "#ebffe9"
          },
          {
            "weight": 8
          }
        ]
      },
      {
        "featureType": "water",
        "elementType": "labels.text.fill",
        "stylers": [
          {
            "color": "#f8fff8"
          }
        ]
      }
    ]
"""

    func setupConstraints()
    {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),

            seeDetailsButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            seeDetailsButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            seeDetailsButton.widthAnchor.constraint(equalToConstant: 63),
            seeDetailsButton.heightAnchor.constraint(equalToConstant: 30),

            map.leftAnchor.constraint(equalTo: view.leftAnchor),
            map.rightAnchor.constraint(equalTo: view.rightAnchor),
            map.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            map.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
}
