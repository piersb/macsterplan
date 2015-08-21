//
//  PartyTest.swift
//  Macsterplan
//
//  Created by Piers Beckley on 21/08/2015.
//  Copyright (c) 2015 Piers Beckley. All rights reserved.
//

import Cocoa
import XCTest
import Macsterplan

class PartyTest: XCTestCase {

    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPartyHasCreationDate() {
        // there's probably a better way of testing the date can be set correctly
//        XCTAssertTrue(aParty.dateCreated?.timeIntervalSinceReferenceDate < NSDate().timeIntervalSinceReferenceDate , "It was somehow created in the future")
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
