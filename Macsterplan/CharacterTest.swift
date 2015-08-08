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

    var aCharacter: gameCharacter!
    
    override func setUp() {
        super.setUp()

        self.aCharacter = gameCharacter()
        
    }
    
    override func tearDown() {

        aCharacter = nil
        
        super.tearDown()
    }

    
    func testCharacterCanBeCreated() {
        XCTAssertNotNil(aCharacter, "Cannot find instance of Character")
    }
    
    func testCharacterCanBeRenamed() {
        aCharacter.name = "Bob Whimsy"
        XCTAssertEqual(aCharacter.name, "Bob Whimsy", "Cannot alter character name")
    }
    
    func testCharacterCanHaveBio() {
        aCharacter.bio = "This is my bio."
        XCTAssertEqual(aCharacter.bio, "This is my bio.", "Cannot update bio")
    }
    
    func testCharacterCanHavePlayer() {
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
