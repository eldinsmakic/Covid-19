//
//  TodaysDateServiceTest.swift
//  Covid-19Tests
//
//  Created by eldin smakic on 21/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import XCTest
@testable import Covid_19

class TodaysDateServiceTest: XCTestCase {

    let todayService = TodaysDateService()
    var date: Date!

    func testGetData() {
        date = Date.init()
        let testDate = todayService.getDate()
        XCTAssertEqual(todayService.dateToString(date: date), todayService.dateToString(date: testDate))
    }

    func testStringToDateSuccess()
    {
        date = Date.init()
        let strinDate = todayService.dateToString(date: date)
        if let dateFromString = todayService.stringToDate(strDate: strinDate)
        {
            XCTAssertEqual(strinDate, todayService.dateToString(date: dateFromString))
            XCTAssertTrue(true)
        } else
        {
            XCTAssertTrue(false)
        }
    }

    func testStringToDateFail()
    {
       let strinDate = "wazah"
       if let dateFromString = todayService.stringToDate(strDate: strinDate)
       {
           XCTAssertNotEqual(strinDate, todayService.dateToString(date: dateFromString))
           XCTAssertTrue(false)
       } else
       {
           XCTAssertTrue(true)
       }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
