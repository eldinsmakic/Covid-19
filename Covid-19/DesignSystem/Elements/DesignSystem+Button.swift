//
//  DesignSystem+Button.swift
//  Covid-19
//
//  Created by eldin smakic on 23/07/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import UIKit

extension DesignSystem {

    public class Button: UIButton
    {
        public init()
        {
            super.init(frame: CGRect())
            setTitle("See details", for: .normal)
            setTitleColor(.systemBlue, for: .normal)
            titleLabel!.font = .systemFont(ofSize: 12, weight: .bold)
            translatesAutoresizingMaskIntoConstraints = false
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}
