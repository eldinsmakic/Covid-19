//
//  DataResponseDTOTests.swift
//  Covid-19Tests
//
//  Created by eldin smakic on 11/08/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import XCTest
@testable import Covid_19

class DataResponseDTOTests: XCTestCase {

    
    let fakeJson = """
      [
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
            },
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
    """

    func testConvertion() {
        let jsonDecoder  = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            let data = try jsonDecoder.decode([DataResponseDTO].self, from: fakeJson.data(using: .utf8)! )
            print(data)
        } catch let error as NSError
        {
            print(error)
        }
    }
}
