//
//  Builder+CaseUpdateModelTests.swift
//  Covid-19Tests
//
//  Created by eldin smakic on 12/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import XCTest
@testable import Covid_19

class Builder_CaseUpdateModelTests: XCTestCase {

    var dataResponseDTO: DataResponseDTO!

    override func setUp() {
        dataResponseDTO = TestHelper.DataFromJson.getData(fromJson: "FakeDataResponseDTO", withDataType: DataResponseDTO.self, onClass: type(of: self))
    }

    func testSingleton() {
        XCTAssertNotNil(Builder.CaseUpdateFactory.builder)
    }

    func testBuild() {
        let caseUpdate = Builder.CaseUpdateFactory.builder.build(fromData: dataResponseDTO)
        XCTAssertNotNil(caseUpdate)
        XCTAssertEqual(5, caseUpdate.totalInfecteds)
        XCTAssertEqual(2, caseUpdate.newInfecteds)
        XCTAssertEqual(10, caseUpdate.totalDeaths)
        XCTAssertEqual(1, caseUpdate.newDeaths)
    }
}
