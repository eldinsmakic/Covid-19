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
    
    let infected = 10
    let death = 20
    let recovered = 5
    
    var caseUpdate: CaseUpdate!
        
    override func setUp() {
        self.caseUpdate = CaseUpdate(infected: self.infected, recovered: self.recovered, death: self.death)
    }

   
    func testGetter() {
        XCTAssertEqual(infected, caseUpdate.infected)
        XCTAssertEqual(death, caseUpdate.death)
        XCTAssertEqual(recovered, caseUpdate.recovered)
    }

}
