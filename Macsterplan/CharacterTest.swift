//
//  CharacterTest.swift
//  Macsterplan
//
//  Created by Piers Beckley on 29/06/2015.
//  Copyright (c) 2015 Piers Beckley. All rights reserved.
//

import Cocoa
import XCTest
import Macsterplan

class CharacterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testCharacterCanBeCreated() {
        let aCharacter = Character()
        XCTAssertNotNil(aCharacter, "Cannot find instance of Character")
    }
    
    func testCharacterCanBeRenamed() {
        var aCharacter = Character()
        aCharacter.name = "Bob Whimsy"
        XCTAssertEqual(aCharacter.name, "Bob Whimsy", "Cannot alter character name")
    }
    
    func testCharacterCanHaveBio() {
        var aCharacter = Character()
        aCharacter.bio = "This is my bio."
        XCTAssertEqual(aCharacter.bio, "This is my bio.", "Cannot update bio")
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
