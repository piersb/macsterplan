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

class PartyTest: MacsterplanTests {

    var aCharacter: GameCharacter!
    var aParty: Party!
    var aCampaign: Campaign!
    
    
    override func setUp() {
        super.setUp()

        //  here are our entities

        
        let characterDescription = NSEntityDescription.entityForName("Character", inManagedObjectContext: managedObjectContext)
        // Can't see any way to rename the entity name from Character (reserved in most other places in Swift, hence less than ideal) to GameCharacter...
        aCharacter = GameCharacter(entity: characterDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        let partyDescription =  NSEntityDescription.entityForName("Party", inManagedObjectContext: managedObjectContext)
        aParty = Party (entity: partyDescription!, insertIntoManagedObjectContext: managedObjectContext)
    
        
    }
    
    override func tearDown() {

        aParty = nil
        aCharacter = nil
        
        
        super.tearDown()
    }
    
    func testPartyCanAddCharacter() {
        aParty.addCharacter(aCharacter)
        XCTAssertTrue(aParty.mutableSetValueForKey("characters").containsObject(aCharacter), "Can't add character to Party")
    }

    func testPartyHasCreationDate() {
        // there's probably a better way of testing the date can be set correctly
        XCTAssertTrue(aParty.dateCreated?.timeIntervalSinceReferenceDate < NSDate().timeIntervalSinceReferenceDate , "It was somehow created in the future")
    }
    


}
