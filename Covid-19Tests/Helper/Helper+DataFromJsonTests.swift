//
//  Helper+DataFromJsonTests.swift
//  Covid-19Tests
//
//  Created by eldin smakic on 12/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import XCTest
@testable import Covid_19

class Helper_DataFromJsonTests: XCTestCase {

    func testGetDataFail() throws {
        let data = Helper.DataFromJson.getData(fromJson: "countryCoordonate", withDataType: CovidResponseDTO.self)

        XCTAssertNil(data)
    }
}
