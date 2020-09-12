//
//  Helper+DateFromDataTests.swift
//  Covid-19Tests
//
//  Created by eldin smakic on 12/09/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import XCTest
@testable import Covid_19

class Helper_DateFromDataTests: XCTestCase {

    func testGetDate()
    {
        XCTAssertTrue(Calendar.current.isDate(Date(), inSameDayAs: Helper.DateFromData.getDate()))
    }

    func testDateToString()
    {
        let dateToString = ISO8601DateFormatter().string(from: Date())

        XCTAssertEqual(dateToString, Helper.DateFromData.dateToString(date: Date()))
    }

    func testStringToDate()
    {
        let dateToString = ISO8601DateFormatter().string(from: Date())

        let stringToDate = ISO8601DateFormatter().date(from: dateToString)!

        XCTAssertTrue(Calendar.current.isDate(stringToDate, inSameDayAs: Helper.DateFromData.stringToDate(strDate: dateToString)!))
    }

    func testDateFormater()
    {
        XCTAssertNotNil(Helper.DateFromData.dateFormater)
    }
}
