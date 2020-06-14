//
//  SelectCountryServiceTest.swift
//  Covid-19Tests
//
//  Created by eldin smakic on 25/05/2020.
//  Copyright © 2020 eldin smakic. All rights reserved.
//

import XCTest
@testable import Covid_19

class SelectCountryServiceTest: XCTestCase {

    let selectCountry = SelectCountryService()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        selectCountry.getCountrySelected().subscribe(onNext: { (country) in
            print(country)
        })
        print("heelo")
        selectCountry.fireCountrySelected(country: "France")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
