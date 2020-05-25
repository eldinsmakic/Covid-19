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
        XCTAssertTrue(todayService.getDate() ==  date)

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
