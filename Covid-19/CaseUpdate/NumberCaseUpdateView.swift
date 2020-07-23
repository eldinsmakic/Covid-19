//
//  NumberCaseUpdateView.swift
//  Covid-19
//
//  Created by eldin smakic on 03/06/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import UIKit

class NumberCaseUpdateView: UIView {

    let caseLabel: UILabel
    let numberCaseLabel: UILabel
    let circle: CircleCaseUpdate

    override init(frame: CGRect) {
        self.caseLabel = UILabel()
        self.numberCaseLabel = UILabel()
        self.circle = CircleCaseUpdate(frame: CGRect(x: 12, y: 0, width: 40, height: 40))
        self.circle.backgroundColor = UIColor.clear
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI()
    {
        self.backgroundColor = UIColor.white
        self.addSubview(self.circle)
        self.setupCaseLabel()
        self.setupNumberCaseLabel()
        self.setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setColor(color: CGColor)
    {
       self.circle.setColor(color: color)
       self.numberCaseLabel.textColor = UIColor(cgColor: color)
    }

    func setTitle(title: String)
    {
        self.caseLabel.text = title
    }

    func setNumber(number: Int)
    {
        self.numberCaseLabel.text = String(number)
    }

    private func setupConstraints()
    {
        NSLayoutConstraint.activate([
            self.circle.topAnchor.constraint(equalTo: self.topAnchor),
            self.circle.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.circle.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.circle.heightAnchor.constraint(equalToConstant: 40),

            self.caseLabel.topAnchor.constraint(equalTo: self.numberCaseLabel.bottomAnchor, constant: 10),
            self.caseLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.caseLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.caseLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            self.numberCaseLabel.topAnchor.constraint(equalTo: self.circle.bottomAnchor, constant: 10),
            self.numberCaseLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.numberCaseLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.numberCaseLabel.heightAnchor.constraint(equalToConstant: 48)
            ])
    }

    private func setupCaseLabel()
    {
        self.caseLabel.text = "infected"
        self.caseLabel.textAlignment = .center
        self.caseLabel.textColor = UIColor(cgColor: CGColor(srgbRed: 168/255, green: 163/255, blue: 163/255, alpha: 1))
        self.caseLabel.font = .systemFont(ofSize: 12, weight: .bold)
        self.addSubview(self.caseLabel)
        self.caseLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupNumberCaseLabel()
    {
        self.numberCaseLabel.textColor = UIColor(cgColor: CGColor(srgbRed: 224.0/255.0, green: 173.0/255.0, blue: 33.0/255.0, alpha: 1))
        self.numberCaseLabel.textAlignment = .center
        self.numberCaseLabel.font = .systemFont(ofSize: 40, weight: .bold)
        self.addSubview(self.numberCaseLabel)
        self.numberCaseLabel.translatesAutoresizingMaskIntoConstraints = false
    }

}
