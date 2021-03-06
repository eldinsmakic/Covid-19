//
//  SelectCountry.swift
//  Covid-19
//
//  Created by eldin smakic on 25/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation

public struct Coordonate: Decodable
{
    public let name: String
    public let countryCode: String
    let latlng: [Double]

    public var lat: Double { latlng[0] }
    public var lng: Double { latlng[1] }
}

public class SelectCountryService
{

    public var countrysCoordonate: [Coordonate]?

    init() {
        self.countrysCoordonate = getCoordonate()
    }

    private func getCoordonate() -> [Coordonate]?
    {
        return Helper.DataFromJson.getData(fromJson: "countryCoordonate", withDataType: [Coordonate].self)
    }

    public func getCoordonate(fromCountry country: String) -> Coordonate?
    {
        return self.countrysCoordonate?.first(where: { $0.name == country })
    }
}
