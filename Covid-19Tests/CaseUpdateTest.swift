//
//  CaseUpdateTest.swift
//  Covid-19Tests
//
//  Created by eldin smakic on 21/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import XCTest
@testable import Covid_19

class CaseUpdateTest: XCTestCase {

    let totalDeaths: Double = 20
    let totalInfecteds: Double = 10
    let totalRecovereds: Double = 5
    let newDeaths: Double = 0
    let newInfecteds: Double = 3
    let newRecovereds: Double = 0

    var caseUpdate: CaseUpdate!

    override func setUp() {
        self.caseUpdate = CaseUpdate(newDeaths: newDeaths, newInfecteds: newInfecteds, newRecovereds: newRecovereds, totalDeaths: totalDeaths, totalInfecteds: totalInfecteds, totalRecovereds: totalRecovereds)
    }

    func testGetter() {
        XCTAssertEqual(totalDeaths, caseUpdate.totalDeaths)
        XCTAssertEqual(totalInfecteds, caseUpdate.totalInfecteds)
        XCTAssertEqual(totalRecovereds, caseUpdate.totalRecovereds)
        XCTAssertEqual(newDeaths, caseUpdate.newDeaths)
        XCTAssertEqual(newInfecteds, caseUpdate.newInfecteds)
        XCTAssertEqual(newRecovereds, caseUpdate.newRecovereds)
    }

}
