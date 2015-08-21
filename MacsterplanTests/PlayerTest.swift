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

class PlayerTest: MacsterplanTests {
    
    
    var aPlayer: Player!
    var anotherPlayer: Player!
   
    override func setUp() {
        super.setUp()
        
        let playerDescription = NSEntityDescription.entityForName("Player", inManagedObjectContext: managedObjectContext)
        
        //here are our test entities
        aPlayer = Player (entity: playerDescription!, insertIntoManagedObjectContext: managedObjectContext)
        anotherPlayer = Player (entity: playerDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
    }
    
    override func tearDown() {
        // tear down our test entities
        aPlayer = nil
        anotherPlayer = nil
        
        super.tearDown()
    }
    

    func testPlayerExists() {
        XCTAssertNotNil(aPlayer, "Can't create player in Core Data")
    }
    
    func testPlayerHasName() {
        aPlayer.name = "Iain Coleman"
        XCTAssertEqual(aPlayer.name!, "Iain Coleman", "Can't set player name")
    }
    
    func testPlayerHasCreationDate() {
        // there's probably a better way of testing the date can be set correctly
        XCTAssertTrue(aPlayer.dateCreated?.timeIntervalSinceReferenceDate < NSDate().timeIntervalSinceReferenceDate , "It was somehow created in the future")
    }


}
