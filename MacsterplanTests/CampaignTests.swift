//
//  CampaignTests.swift
//  Macsterplan
//
//  Created by Piers Beckley on 03/08/2015.
//  Copyright (c) 2015 Piers Beckley. All rights reserved.
//

import Cocoa
import XCTest
import Macsterplan

class CampaignTests: XCTestCase {
    
    // setting up our core data variables
    var managedObjectModel: NSManagedObjectModel!
    var persistentStoreCoordinator: NSPersistentStoreCoordinator!
    var managedObjectContext: NSManagedObjectContext!
    
    // setting up our test variables
    
    var aCampaign: Campaign!
    var aCharacter: GameCharacter!
    var aPlayer: Player!
    
    override func setUp() {
        super.setUp()
        
        // set up our core data, and create player, character, and campaign entries
//        let managedObjectContext = CoreDataHelper.setUpInMemoryManagedObjectContext()
//        
//        let playerDescription = NSEntityDescription.entityForName("Player", inManagedObjectContext: managedObjectContext)
//        aPlayer = Player(entity: playerDescription!, insertIntoManagedObjectContext: managedObjectContext)
//        
//        let characterDescription = NSEntityDescription.entityForName("Character", inManagedObjectContext: managedObjectContext)
//        aCharacter = GameCharacter(entity: characterDescription!, insertIntoManagedObjectContext: managedObjectContext)
//        
//        let campaignDescription = NSEntityDescription.entityForName("Campaign", inManagedObjectContext: managedObjectContext)
//        aCampaign = Campaign(entity: campaignDescription!, insertIntoManagedObjectContext: managedObjectContext)
//        
//        println("CHECKING OUT CAMPAIGN")
//        println(aCampaign.dateCreated)
//        
//        managedObjectContext.save(nil)

    }
    
    override func tearDown() {
        
        // tear down our core data stack
        managedObjectModel = nil
        persistentStoreCoordinator = nil
        managedObjectContext = nil       
        
        aCampaign = nil
        aCharacter = nil
        aPlayer = nil

        
        super.tearDown()
    }

    
    func testCampaignCanBeCreated() {

        
        let playerDescription = NSEntityDescription.entityForName("Player", inManagedObjectContext: managedObjectContext)
        aPlayer = Player(entity: playerDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        let characterDescription = NSEntityDescription.entityForName("Character", inManagedObjectContext: managedObjectContext)
        aCharacter = GameCharacter(entity: characterDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        let campaignDescription = NSEntityDescription.entityForName("Campaign", inManagedObjectContext: managedObjectContext)
        aCampaign = Campaign(entity: campaignDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        println("CHECKING OUT CAMPAIGN")
        println(aCampaign.dateCreated)
        
        managedObjectContext.save(nil)

    }
    
    func testThingsAreNotPersistent() {
        println("DOES IT PERSIST?")
        println(aCampaign.dateCreated)
        XCTAssertNotNil(aCampaign, "Campaign cannot be created")
    }
    
    func testCampaignCanHaveName() {
        aCampaign.name = "The Eyes of the Overworld"
        XCTAssertEqual(aCampaign.name, "The Eyes of the Overworld", "Campaign name cannot be set")
    }
//    
//    func testCampaignCanHavePlayerCharacter() {
//        aCampaign.addCharacter (aCharacter, whoseTypeIs: "PC")
//        XCTAssertTrue(aCampaign.isCharacterAPC (aCharacter), "PC is not showing up as a PC")
//    }
//    
//    func testCampaignCanHaveNonPlayerCharacter() {
//        aCampaign.addCharacter(aCharacter, whoseTypeIs: "NPC")
//        XCTAssertFalse(aCampaign.isCharacterAPC(aCharacter), "NPC is showing up as PC")
//    }
    
    func testCampaignCanAddPlayer() {
//        aCampaign.addPlayer(aPlayer)
//        aCampaign.listPlayers()
    }

    func testCampaignHasCreationDate() {
        
//        NSLog("%@", aCampaign.dateCreated)
    }
    
   
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
