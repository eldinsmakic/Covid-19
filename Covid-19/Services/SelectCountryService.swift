//
//  SelectCountry.swift
//  Covid-19
//
//  Created by eldin smakic on 25/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import PromiseKit

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
        self.countrysCoordonate = getCoordonate()!
    }

    private func getCoordonate() -> [Coordonate]?
    {
        guard let url = Bundle.main.url(forResource: "countryCoordonate", withExtension: "json")  else { return nil }

        do {
            let data = try Data(contentsOf: url)

            return try self.jsonDecoder.decode([Coordonate].self, from: data)
        } catch let error
        {
            print("HHH \(error)")
            return nil
        }
    }

    public func getCoordonate(fromCountry country: String) -> Coordonate?
    {
        return self.countrysCoordonate?.first(where: { $0.name == country })
    }

    lazy var jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        return jsonDecoder
    }()
}
