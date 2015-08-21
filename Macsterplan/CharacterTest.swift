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

class CharacterTest: MacsterplanTests {

    var aCharacter: GameCharacter!
    
    override func setUp() {
        super.setUp()
        
        //  here are our entities
        let entityDescription = NSEntityDescription.entityForName("Character", inManagedObjectContext: managedObjectContext)
                            // Can't see any way to rename the entity name from Character (reserved in most other places in Swift, hence less than ideal) to GameCharacter...
        aCharacter = GameCharacter(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
    }
    
    override func tearDown() {

        aCharacter = nil
        
        super.tearDown()
    }

    
    func testCharacterCanBeCreated() {
        XCTAssertNotNil(aCharacter, "Cannot create instance of Character")
    }
    
    func testCharacterCanBeRenamed() {
        aCharacter.name = "Bob Whimsy"
        XCTAssertEqual(aCharacter.name!, "Bob Whimsy", "Cannot alter character name")
    }
    
    
    
    func testCharacterCanHaveBio() {
        aCharacter.bio = "This is my bio."
        XCTAssertEqual(aCharacter.bio!, "This is my bio.", "Cannot update bio")
    }

    
    func testCharacterCanBeAssignedToPlayer() {
        
        let entityDescription = NSEntityDescription.entityForName("Player", inManagedObjectContext: managedObjectContext)
        // Can't see any way to rename the entity name from Character (reserved in most other places in Swift, hence less than ideal) to GameCharacter...
        let aPlayer = Player(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        aCharacter.player = aPlayer
        
        // a character's player should now be set to the player
        XCTAssertEqual(aCharacter.player!, aPlayer, "Cannot set Player for Character")
        
        // and that player should have this character set as one of their characters
        XCTAssertTrue(aPlayer.characters!.contains(aCharacter), "Cannot set Character for Player")
    }

    
    
    func testCharacterCanBePC() {
        aCharacter.characterType = "PC"
        XCTAssertEqual(aCharacter.characterType!, "PC", "Cannot set Character as PC")
    }
    
    func testCharacterCanBeNPC() {
        aCharacter.characterType = "NPC"
        XCTAssertEqual(aCharacter.characterType!, "NPC", "Cannot set Character as NPC")
    }
    
    func testCharacterCannotBeSomethingOtherThanPCorNPC () {
        aCharacter.characterType = "blargle!"
        var error : NSError? = nil
        if !aCharacter.managedObjectContext!.save(&error) {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            XCTAssertNotNil(error, "Should throw error when confronted with a character type that's neither PC nor NPC")
        }
        
    }
    


}
