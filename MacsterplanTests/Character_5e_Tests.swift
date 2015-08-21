//
//  Character_5e_Tests.swift
//  Macsterplan
//
//  Created by Piers Beckley on 21/08/2015.
//  Copyright (c) 2015 Piers Beckley. All rights reserved.
//

import Cocoa
import XCTest
import Macsterplan

class Character_5e_Tests: CharacterTest {

    var thisCharacter: Character_5e!
        
    override func setUp() {
        super.setUp()

        //  here are our entities
        let entityDescription = NSEntityDescription.entityForName("Character_5e", inManagedObjectContext: managedObjectContext)
        thisCharacter = Character_5e (entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        
    }
    
    
    override func tearDown() {

        aCharacter = nil
        
        super.tearDown()
    }

    func testCharacterCreationDefaultsToLevel1() {
        XCTAssertTrue(thisCharacter.level == 1, "Character level is not equal to 1 on Character Creation")
    }

}
