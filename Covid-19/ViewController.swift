//
//  ViewController.swift
//  Covid-19
//
//  Created by eldin smakic on 11/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import UIKit
import GoogleMaps
import AwaitKit

class ViewController: UIViewController {

    let caseUpdateView = CaseUpdateView(frame: CGRect(x: 0, y: 200, width: 364, height: 200))
    let countryPicker = SelectCountryPickerView()
    var camera: GMSCameraPosition!
    var mapView: GMSMapView!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCountry(notification:)), name: countryIsSelected, object: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCountry(notification:)), name: countryIsSelected, object: nil)
    }

    override func viewDidLoad() {
        view.addSubview(self.caseUpdateView)
        view.addSubview(countryPicker)
        
        self.camera = GMSCameraPosition.camera(withLatitude: 46.227638, longitude: 2.213749, zoom: 6.0)
        self.mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)

        view.backgroundColor = .white
        self.caseUpdateView.backgroundColor = .green
        super.viewDidLoad()
        self.countryPicker.translatesAutoresizingMaskIntoConstraints = false
        mapView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.countryPicker.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0),
            self.countryPicker.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 0),
            self.countryPicker.rightAnchor.constraint(equalTo: view.rightAnchor),

            self.caseUpdateView.topAnchor.constraint(equalTo: self.countryPicker.bottomAnchor, constant: 20),
            self.caseUpdateView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            self.caseUpdateView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            self.caseUpdateView.heightAnchor.constraint(equalToConstant: 200),

            mapView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mapView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.topAnchor.constraint(equalTo: caseUpdateView.bottomAnchor, constant: 20)])
    }

    @objc func updateCountry(notification: NSNotification)
    {
        let country = self.countryPicker.selectCountry
        self.caseUpdateView.dataManager.fetchDatasByCountry(country: country, date: self.caseUpdateView.dataManager.goodDate)
        async {
            do
            {
                    let cordonate = try await(self.countryPicker.selectCountryService.getCordonateFromACountry(country: country))
                    self.camera = GMSCameraPosition.camera(withLatitude: cordonate.lat, longitude: cordonate.lng, zoom: 6.0)
                    DispatchQueue.main.async {
                        self.mapView.animate(toLocation: CLLocationCoordinate2D(latitude: cordonate.lat, longitude: cordonate.lng))
                    }
            }
            catch let error as NSError
            {
                print(error)
            }
        }

    }

}
