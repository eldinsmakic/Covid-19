//
//  ViewController.swift
//  Covid-19
//
//  Created by eldin smakic on 11/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let caseUpdateView = CaseUpdateView(frame: CGRect(x: 0, y: 200, width: 364, height: 200))
    let countryPicker = SelectCountryPickerView()

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
        view.backgroundColor = .white
        self.caseUpdateView.backgroundColor = .green
        super.viewDidLoad()
        self.countryPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([self.countryPicker.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0),
                                     self.countryPicker.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 0),
                                     self.countryPicker.rightAnchor.constraint(equalTo: view.rightAnchor)])
        NSLayoutConstraint.activate([ self.caseUpdateView.topAnchor.constraint(equalTo: view.topAnchor),
                                      self.caseUpdateView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
    }

    @objc func updateCountry(notification: NSNotification)
    {
        let country = self.countryPicker.selectCountry
        self.caseUpdateView.dataManager.fetchDatasByCountry(country: country, date: self.caseUpdateView.dataManager.goodDate)
    }

}
