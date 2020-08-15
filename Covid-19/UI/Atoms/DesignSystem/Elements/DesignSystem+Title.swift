//
//  DesignSystem+Title.swift
//  Covid-19
//
//  Created by eldin smakic on 23/07/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//
import UIKit

extension DesignSystem {

    public class title: UILabel {

        public init(name: String) {
            super.init(frame: CGRect())
            text = name
            font = .systemFont(ofSize: 20, weight: .bold)
            translatesAutoresizingMaskIntoConstraints = false
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
