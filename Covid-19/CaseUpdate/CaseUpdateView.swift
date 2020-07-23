//
//  CaseUpdateView.swift
//  Covid-19
//
//  Created by eldin smakic on 03/06/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import UIKit

class CaseUpdateView: UIView {

    let titleLabel: UILabel
    let dateUpdateLabel: UILabel
    let seeDetailsButton: UIButton
    let infectedNumber: NumberCaseUpdateView
    let deathNumber: NumberCaseUpdateView
    let recoveredNumber: NumberCaseUpdateView
    let dataManager: FakeLocalDataManager

    override init(frame: CGRect) {
        self.titleLabel = UILabel()
        self.dateUpdateLabel = UILabel()
        self.seeDetailsButton = UIButton()
        self.dataManager = FakeLocalDataManager()
        self.infectedNumber = NumberCaseUpdateView(frame: CGRect(x: 0, y: 60, width: 100, height: 111))
        self.recoveredNumber = NumberCaseUpdateView(frame: CGRect(x: 0, y: 0, width: 100, height: 111))
        self.deathNumber = NumberCaseUpdateView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.infectedNumber.backgroundColor = .clear
        self.infectedNumber.setColor(color: CGColor(srgbRed: 224/255, green: 173/255, blue: 33/255, alpha: 1))
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.createObserver()
        self.infectedNumber.translatesAutoresizingMaskIntoConstraints = false
        self.setupDeathNumber()
        self.setupRecoveredNumber()
        self.addSubview(self.infectedNumber)
        self.setupsUI()
        self.addAllConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createObserver()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(updateUpdateView(notification:)), name: NSNotification.Name(rawValue: dataReady), object: nil)
    }

    @objc func updateUpdateView(notification: NSNotification)
    {
        let data = self.dataManager.dataCovid!
        let caseUpdate = data.caseUpdate
        let date = data.date
        self.setDate(date: date)
        self.infectedNumber.setNumber(number: caseUpdate.infected)
        self.recoveredNumber.setNumber(number: caseUpdate.recovered)
        self.deathNumber.setNumber(number: caseUpdate.death)
    }

    func setDate(date: Date)
    {
        let text = "Newest update on "
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d"
        let dateString = dateFormatter.string(from: date)
        self.dateUpdateLabel.text = text + dateString
    }

    func setupDeathNumber()
    {
        self.deathNumber.backgroundColor = .white
        self.deathNumber.setTitle(title: "Death")
        self.deathNumber.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.deathNumber)
        self.deathNumber.setColor(color: CGColor(srgbRed: 224.0/255.0, green: 106.0/255.0, blue: 33.0/255.0, alpha: 1))
    }

    func setupRecoveredNumber()
    {
       self.recoveredNumber.backgroundColor = .clear
       self.recoveredNumber.setTitle(title: "Recovered")
       self.recoveredNumber.translatesAutoresizingMaskIntoConstraints = false
       self.addSubview(self.recoveredNumber)
        self.recoveredNumber.setColor(color: CGColor(srgbRed: 33.0/255.0, green: 224.0/255.0, blue: 92.0/255.0, alpha: 1))
    }

    func addAllConstraints()
    {
        NSLayoutConstraint.activate([

            self.infectedNumber.topAnchor.constraint(equalTo: self.dateUpdateLabel.bottomAnchor, constant: 78),
            self.infectedNumber.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            self.infectedNumber.rightAnchor.constraint(equalTo: self.leftAnchor, constant: 112),
            self.infectedNumber.heightAnchor.constraint(equalToConstant: 120),

            self.deathNumber.topAnchor.constraint(equalTo: self.infectedNumber.topAnchor),
            self.deathNumber.leftAnchor.constraint(equalTo: infectedNumber.rightAnchor, constant: 20),
            self.deathNumber.rightAnchor.constraint(equalTo: infectedNumber.rightAnchor, constant: 112),
            self.deathNumber.heightAnchor.constraint(equalToConstant: 120),

            self.recoveredNumber.topAnchor.constraint(equalTo: self.infectedNumber.topAnchor),
            self.recoveredNumber.leftAnchor.constraint(equalTo: deathNumber.rightAnchor, constant: 20),
            self.recoveredNumber.rightAnchor.constraint(equalTo: deathNumber.rightAnchor, constant: 112),
            self.recoveredNumber.heightAnchor.constraint(equalToConstant: 120),
 
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 20),

            self.dateUpdateLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
            self.dateUpdateLabel.leftAnchor.constraint(equalTo: self.leftAnchor),

            self.seeDetailsButton.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 3),
            self.seeDetailsButton.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
    }

    func setupTitleLabel()
    {
        self.titleLabel.text = "Case Update"
        self.titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        self.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupDateUpdateLabel()
    {
        self.dateUpdateLabel.text = "newest update on march 28"
        self.dateUpdateLabel.textColor =  UIColor(cgColor: CGColor(srgbRed: 168/255, green: 163/255, blue: 163/255, alpha: 1))
        self.dateUpdateLabel.font = .systemFont(ofSize: 12, weight: .bold)
        self.addSubview(self.dateUpdateLabel)
        self.dateUpdateLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupSeeDetailsButton()
    {
        self.seeDetailsButton.setTitle("See details", for: .normal)
        self.seeDetailsButton.setTitleColor(.systemBlue, for: .normal)
        self.seeDetailsButton.titleLabel!.font = .systemFont(ofSize: 12, weight: .bold)
        self.seeDetailsButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.seeDetailsButton)
    }

    func setupsUI()
    {
        setupTitleLabel()
        setupDateUpdateLabel()
        setupSeeDetailsButton()
    }
}
