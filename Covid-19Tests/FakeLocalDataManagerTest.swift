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
    let FranceDeath = 20
    let EnglandDeath = 10
    let oneCountryDate21 = ["England"]
    let twoCountryDate23 = ["France","England",]

    func testGettingDataGetNilWithBadCountry()
    {
        if fakeLocalDM.getDatas(country: "Frdaance", date: Date.init()) != nil
           {
             XCTAssertTrue(false)
           }
             XCTAssertTrue(true)
    }
       

    func testGetData() {
        
       let caseUpdate = fakeLocalDM.getDatas(country: "France", date: Date.init())
        XCTAssertEqual(FranceDeath, caseUpdate!.death)
        //XCTAssertTrue(false)
    }
    
   
    func testGetDataFail()
    {
        let caseUpdate = fakeLocalDM.getDatas(country: "England", date: Date.init())
        XCTAssertNotEqual(FranceDeath, caseUpdate!.death)
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
        let goodDate = ISO8601DateFormatter().date(from:"2020-05-21T09:12:23Z" )!
        let caseUpdate = fakeLocalDM.getDatas(country: "England", date: goodDate )!
        XCTAssertEqual(EnglandDeath, caseUpdate.death)
    }
    
    func testGetAllCountry()
    {
        let dateWithOneCountry = ISO8601DateFormatter().date(from:"2020-05-21T09:12:23Z" )!
        let country = fakeLocalDM.getAllCuntry(date: dateWithOneCountry)
        XCTAssertEqual(country, oneCountryDate21)
        
        let dateWithTwoCountry = ISO8601DateFormatter().date(from:"2020-05-23T09:12:23Z" )!
        let countrys = fakeLocalDM.getAllCuntry(date: dateWithTwoCountry)
        XCTAssertEqual(countrys, twoCountryDate23)
        
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
