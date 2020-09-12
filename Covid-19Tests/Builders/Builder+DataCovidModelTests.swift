//
//  Builder+DataCovidModelTests.swift
//  Covid-19Tests
//
//  Created by eldin smakic on 12/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import XCTest
@testable import Covid_19

class Builder_DataCovidModelTests: XCTestCase {

    func testSingleton() {
        XCTAssertNotNil(Builder.DataCovidFactory.builder)
    }

    func testBuild()
    {
        let dataResponseDTO = TestHelper.DataFromJson.getData(fromJson: "FakeDataResponseDTO", withDataType: DataResponseDTO.self, onClass: type(of: self))!

        let date = Date()
        let country = "France"

        let dataCovid = Builder.DataCovidFactory.builder.build(fromData: dataResponseDTO, withCountry: country, onDate: date)

        XCTAssertNotNil(dataCovid)

        XCTAssertEqual(dataCovid.country, country)
        XCTAssertEqual(dataCovid.date, date)
    }
}
