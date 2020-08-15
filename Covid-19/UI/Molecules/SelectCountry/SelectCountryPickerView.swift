//
//  SelectCountryPickerView.swift
//  Covid-19
//
//  Created by eldin smakic on 14/06/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import UIKit
let countryIsSelected = NSNotification.Name("fr.eldinsmakic.countryIsSelected")

class SelectCountryPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {

    var pays: [String] = []
    var selectCountry: String
    let selectCountryService: SelectCountryService

    override init(frame: CGRect) {
        self.selectCountry = ""
        self.selectCountryService = SelectCountryService()
        super.init(frame: frame)
        self.delegate = self
        self.dataSource = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pays.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pays[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectCountry = pays[row]
        NotificationCenter.default.post(name: countryIsSelected, object: pays[row])
    }

}
