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
    let spreadOfVirus = SpreadOfVirusView()
    let topImage = TopCaseUpdate()
    var camera: GMSCameraPosition!
    var mapView: GMSMapView!
    let dataManager = OwidDataManager()

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
        view.addSubview(spreadOfVirus.view)
        view.addSubview(topImage.view)

        view.backgroundColor = .white
        let sorted = self.dataManager.dictIsoToCountry.sorted {
            $0 < $1
        }

        for (key, _) in sorted {
            self.countryPicker.pays.append(key)
        }

        super.viewDidLoad()
        self.caseUpdateView.dataManager = self.dataManager
        self.countryPicker.translatesAutoresizingMaskIntoConstraints = false
        addConstraint()

    }

    func addConstraint()
    {
        NSLayoutConstraint.activate([
            self.topImage.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.topImage.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.topImage.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.topImage.view.heightAnchor.constraint(equalToConstant: 300),

            self.countryPicker.topAnchor.constraint(equalTo: self.topImage.view.bottomAnchor),
            self.countryPicker.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -20),
            self.countryPicker.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20),
            self.countryPicker.heightAnchor.constraint(equalToConstant: 50),

            self.caseUpdateView.topAnchor.constraint(equalTo: self.countryPicker.bottomAnchor, constant: 20),
            self.caseUpdateView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            self.caseUpdateView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            self.caseUpdateView.heightAnchor.constraint(equalToConstant: 272),

            spreadOfVirus.view.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            spreadOfVirus.view.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            spreadOfVirus.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            spreadOfVirus.view.topAnchor.constraint(equalTo: caseUpdateView.bottomAnchor)
        ])
    }

    @objc func updateCountry(notification: NSNotification)
    {
        let country = self.countryPicker.selectCountry
        self.caseUpdateView.dataManager.getData(fromCountry: country, at: Date())
        async {
            do
            {
                let cordonate = try await(self.countryPicker.selectCountryService.getCordonateFromACountry(country: country))
                self.camera = GMSCameraPosition.camera(withLatitude: cordonate.lat, longitude: cordonate.lng, zoom: 6.0)
                DispatchQueue.main.async {
                    self.spreadOfVirus.map.animate(toLocation: CLLocationCoordinate2D(latitude: cordonate.lat, longitude: cordonate.lng))
                }
            }
            catch let error as NSError
            {
                print(error)
            }
        }

    }

}
