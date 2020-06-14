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
        self.infectedNumber.backgroundColor = .systemBlue
        super.init(frame: frame)
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
       self.recoveredNumber.backgroundColor = .systemRed
       self.recoveredNumber.setTitle(title: "Recovered")
       self.recoveredNumber.translatesAutoresizingMaskIntoConstraints = false
       self.addSubview(self.recoveredNumber)
        self.recoveredNumber.setColor(color: CGColor(srgbRed: 33.0/255.0, green: 224.0/255.0, blue: 92.0/255.0, alpha: 1))
    }

    func addAllConstraints()
    {
        self.addConstraintsTitleLabel()
        self.addConstraintsDateUpdateLabel()
        self.addConstraintsSeeDetailsButton()
        self.addConstraintsInfectedNumber()
        self.addConstraintDeathNumber(infected: self.infectedNumber)
        self.addConstraintRecoverNumber(death: self.deathNumber)
    }

    func addConstraintsInfectedNumber()
    {
        NSLayoutConstraint.activate([self.infectedNumber.topAnchor.constraint(equalTo: self.dateUpdateLabel.bottomAnchor, constant: 25),
        self.infectedNumber.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
        self.infectedNumber.rightAnchor.constraint(equalTo: self.leftAnchor, constant: 112),
        self.infectedNumber.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }

    func addConstraintDeathNumber(infected: NumberCaseUpdateView)
    {

        NSLayoutConstraint.activate([self.deathNumber.topAnchor.constraint(equalTo: self.dateUpdateLabel.bottomAnchor, constant: 25),
                                     self.deathNumber.leftAnchor.constraint(equalTo: infected.rightAnchor, constant: 20),
                                     self.deathNumber.rightAnchor.constraint(equalTo: infected.rightAnchor, constant: 112),
        self.deathNumber.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }

    func addConstraintRecoverNumber(death: NumberCaseUpdateView)
    {
        NSLayoutConstraint.activate([self.recoveredNumber.topAnchor.constraint(equalTo: self.dateUpdateLabel.bottomAnchor, constant: 25),
                                          self.recoveredNumber.leftAnchor.constraint(equalTo: death.rightAnchor, constant: 20),
                                          self.recoveredNumber.rightAnchor.constraint(equalTo: death.rightAnchor, constant: 112),
             self.recoveredNumber.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }

    func addConstraintsTitleLabel()
    {
        NSLayoutConstraint.activate([ self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
                                      self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor)])
    }

    func addConstraintsDateUpdateLabel()
    {
        NSLayoutConstraint.activate([ self.dateUpdateLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
        self.dateUpdateLabel.leftAnchor.constraint(equalTo: self.leftAnchor)])
    }

    func addConstraintsSeeDetailsButton()
    {
        NSLayoutConstraint.activate([ self.seeDetailsButton.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 3),
        self.seeDetailsButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15)])
    }

    func setupTitleLabel()
    {
        self.titleLabel.text = "Case Update"
        self.titleLabel.font = .systemFont(ofSize: 20)
        self.titleLabel.backgroundColor = .red
        self.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupDateUpdateLabel()
    {
        self.dateUpdateLabel.text = "newest update on march 28"
        self.dateUpdateLabel.backgroundColor = .orange
        self.dateUpdateLabel.font = .systemFont(ofSize: 12)
        self.addSubview(self.dateUpdateLabel)
        self.dateUpdateLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupSeeDetailsButton()
    {
        self.seeDetailsButton.setTitle("See details", for: .normal)
        self.seeDetailsButton.titleLabel?.font = .systemFont(ofSize: 12)
        self.seeDetailsButton.backgroundColor = .blue
        self.addSubview(self.seeDetailsButton)
        self.seeDetailsButton.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupsUI()
    {
        setupTitleLabel()
        setupDateUpdateLabel()
        setupSeeDetailsButton()
    }
}
