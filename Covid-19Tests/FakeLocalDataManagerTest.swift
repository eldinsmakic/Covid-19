//
//  FakeLocalDataManagerTest.swift
//  Covid-19Tests
//
//  Created by eldin smakic on 22/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import XCTest
@testable import Covid_19

class FakeLocalDataManagerTest: XCTestCase {

    let fakeLocalDM = FakeLocalDataManager()
    let franceDeath = 20
    let englandDeath = 10
    let oneCountryDate21 = ["England"]
    let twoCountryDate23 = ["France", "England"]
    let goodDate = ISO8601DateFormatter().date(from: "2020-05-21T09:12:23Z" )!

    func testGettingDataGetNilWithBadCountry()
    {
        if fakeLocalDM.getDatas(country: "Frdaance", date: self.goodDate) != nil
           {
             XCTAssertTrue(false)
           }
             XCTAssertTrue(true)
    }

    func testGetDatasFail()
    {
        let caseUpdate = fakeLocalDM.getDatas(country: "England", date: self.goodDate)
        XCTAssertNotEqual(franceDeath, caseUpdate!.death)
    }

    func testGetDataFailWithDate()
    {
        let badDate = Date.init(timeIntervalSince1970: TimeInterval(exactly: 100.0)!)
        let caseUpdate = fakeLocalDM.getDatas(country: "England", date: badDate )
        if caseUpdate != nil
        {
             XCTAssertTrue(false)
        }
        else
        {
             XCTAssertTrue(true)
        }

    }

    func testGetDataWinWithDate()
    {
        let goodDate = ISO8601DateFormatter().date(from: "2020-05-21T09:12:23Z" )!
        let caseUpdate = fakeLocalDM.getDatas(country: "England", date: goodDate )!
        XCTAssertEqual(englandDeath, caseUpdate.death)
    }

    func testGetAllCountry()
    {
        let dateWithOneCountry = ISO8601DateFormatter().date(from: "2020-05-21T09:12:23Z" )!
        let country = fakeLocalDM.getAllCuntry(date: dateWithOneCountry)
        XCTAssertEqual(country, oneCountryDate21)

        let dateWithTwoCountry = ISO8601DateFormatter().date(from: "2020-05-23T09:12:23Z" )!
        let countrys = fakeLocalDM.getAllCuntry(date: dateWithTwoCountry)
        XCTAssertEqual(countrys, twoCountryDate23)

        let date = Date.init()
        let countryEmpty = fakeLocalDM.getAllCuntry(date: date)
        XCTAssertEqual([], countryEmpty)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
