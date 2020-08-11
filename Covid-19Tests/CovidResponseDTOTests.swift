//
//  CovidResponseDTOTests.swift
//  Covid-19Tests
//
//  Created by eldin smakic on 11/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import XCTest
@testable import Covid_19

class CovidResponseDTOTests: XCTestCase {

    let fakeJson = """
    {
           "continent": "Asia",
           "location": "Afghanistan",
           "population": 38928341.0,
           "population_density": 54.422,
           "median_age": 18.6,
           "aged_65_older": 2.581,
           "aged_70_older": 1.337,
           "gdp_per_capita": 1803.987,
           "cardiovasc_death_rate": 597.029,
           "diabetes_prevalence": 9.59,
           "handwashing_facilities": 37.746,
           "hospital_beds_per_thousand": 0.5,
           "life_expectancy": 64.83,
           "data": [
               {
                   "date": "2019-12-31",
                   "total_cases": 0.0,
                   "new_cases": 0.0,
                   "total_deaths": 0.0,
                   "new_deaths": 0.0,
                   "total_cases_per_million": 0.0,
                   "new_cases_per_million": 0.0,
                   "total_deaths_per_million": 0.0,
                   "new_deaths_per_million": 0.0
               }
            ]
    }
    """

    func testConvertion() {
        let jsonDecoder  = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            let data = try jsonDecoder.decode(CovidResponseDTO.self, from: fakeJson.data(using: .utf8)! )
            print(data)
            XCTAssertTrue(true)
        } catch let error as NSError
        {
            print(error)
            XCTAssertTrue(false)
        }
    }

}
