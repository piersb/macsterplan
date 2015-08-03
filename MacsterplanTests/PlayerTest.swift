//
//  PlayerTest.swift
//  Macsterplan
//
//  Created by Piers Beckley on 03/08/2015.
//  Copyright (c) 2015 Piers Beckley. All rights reserved.
//

import Cocoa
import XCTest
import Macsterplan

class PlayerTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPlayerExists() {
        var aPlayer = Player()
        XCTAssertNotNil(aPlayer, "Can't create player")
    }
    
    func testPlayerHasName() {
        var aPlayer = Player()
        aPlayer.name = "Iain Coleman"
        XCTAssertEqual (aPlayer.name, "Iain Coleman", "Can't rename Player")
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
