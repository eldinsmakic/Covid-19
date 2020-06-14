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

struct Cordonate: Decodable
{
    let lat: Double
    let lng: Double
}

class SelectCountryService
{
    var country = ""
    var cordonate: Cordonate!

    func getCordonateFromACountry(country: String) -> Promise<Cordonate>
    {
        return Promise { seal in AF.request("https://maps.googleapis.com/maps/api/geocode/json?address="+country+"&language=fr&key=AIzaSyCMHnSYPacdShtvfn7h-6VwzuB7k4gCPuA").responseJSON { response in
                let json = JSON(response.value)
                do
                {
                    let location =  try json["results"][0]["geometry"]["location"].rawData()
                                  self.cordonate = try JSONDecoder().decode(Cordonate.self, from: location)
                    seal.fulfill(self.cordonate)
                }
                catch let error as NSError
                {
                    print(error)
                    seal.reject(error)
                }

            }
        }
    }

    func fireCountrySelected(country: String)
    {
        self.country = country
    }
}
