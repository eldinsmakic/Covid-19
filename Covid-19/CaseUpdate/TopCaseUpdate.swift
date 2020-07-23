//
//  TopCaseUpdate.swift
//  Covid-19
//
//  Created by eldin smakic on 20/06/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import UIKit

class TopCaseUpdate: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(virusImage)
        wrapperView.addSubview(headLabel)
//        wrapperView.addSubview(doctorImage)
        view.addSubview(wrapperView)
         setupConstraints()
        // Do any additional setup after loading the view.
    }

    var virusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "virus", in: Bundle.main, compatibleWith: nil)
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    var headLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "All you need is    stay at home"
        label.textColor = .white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    var wrapperView: TopImageCaseUpdate = {
        let view = TopImageCaseUpdate()
        view.clipsToBounds = true
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    func setupConstraints()
    {
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: view.topAnchor),
            wrapperView.leftAnchor.constraint(equalTo: view.leftAnchor),
            wrapperView.rightAnchor.constraint(equalTo: view.rightAnchor),
            wrapperView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            headLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            headLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.bounds.width/2),
            headLabel.widthAnchor.constraint(equalToConstant: 180),

            virusImage.topAnchor.constraint(equalTo: wrapperView.topAnchor),
            virusImage.leftAnchor.constraint(equalTo: wrapperView.leftAnchor),
            virusImage.rightAnchor.constraint(equalTo: wrapperView.rightAnchor),
            virusImage.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor)
        ])
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
