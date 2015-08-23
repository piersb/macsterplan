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
        thisCharacter = nil
        super.tearDown()
    }

    func testCharacterCreationDefaultsToLevel1() {
        XCTAssertTrue(thisCharacter.level == 1, "Character level is not equal to 1 on Character Creation")
    }

    func testCharacterCannotHaveALevelLessThanOne() {
        thisCharacter.level = 0
        var error : NSError? = nil
        if !thisCharacter.managedObjectContext!.save(&error) {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
        }
        XCTAssertNotNil(error, "Should throw error when character level is set to 0")
    }
    
    func testCharacterCannotHaveALevelGreaterThanThirty() {
        thisCharacter.level = 21
        var error : NSError? = nil
        if !thisCharacter.managedObjectContext!.save(&error) {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
        }
        XCTAssertNotNil(error, "Should throw error when character level is set to 21")
    }
    
    func testCharacterLevelCanBeChanged() {
        thisCharacter.level = 20
        XCTAssertTrue(thisCharacter.level == 20, "Can't change character level")
        
    }
    
    func testCharacterCanHaveAClass() {
        thisCharacter.characterClass = "fighter"
        XCTAssertTrue(thisCharacter.characterClass == "fighter", "Can't set character class to a string")
    }
    
    
    
    
}
