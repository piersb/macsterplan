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

    
    func testCharacterCanBeCreated() {
        let aCharacter = gameCharacter()
        XCTAssertNotNil(aCharacter, "Cannot find instance of Character")
    }
    
    func testCharacterCanBeRenamed() {
        var aCharacter = gameCharacter()
        aCharacter.name = "Bob Whimsy"
        XCTAssertEqual(aCharacter.name, "Bob Whimsy", "Cannot alter character name")
    }
    
    func testCharacterCanHaveBio() {
        var aCharacter = gameCharacter()
        aCharacter.bio = "This is my bio."
        XCTAssertEqual(aCharacter.bio, "This is my bio.", "Cannot update bio")
    }
    
    func testCharacterCanHavePlayer() {
        var aCharacter = gameCharacter()
        aCharacter.player = "Piers"
        XCTAssertEqual(aCharacter.player, "Piers", "Cannot give Character to Player")
    }
//    
//    func testCharacterCanBePC() {
//        var aCharacter = Character()
//        XCTAssertEqual(aCharacter.type, "PC", "Cannot set Character as PC")
//    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
