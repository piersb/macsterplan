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
    var aSecondPlayer: Player!
    
    override func setUp() {
        super.setUp()
        
        // we need to create an in memory store to test core data
        managedObjectModel = NSManagedObjectModel.mergedModelFromBundles([NSBundle.mainBundle()])!
        
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        persistentStoreCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: nil)
        
        managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
        
        //create player, character, and campaign entries
        
        let playerDescription = NSEntityDescription.entityForName("Player", inManagedObjectContext: managedObjectContext)
        aPlayer = Player(entity: playerDescription!, insertIntoManagedObjectContext: managedObjectContext)
        aSecondPlayer = Player(entity: playerDescription!, insertIntoManagedObjectContext: managedObjectContext) // should probably be stripped out of setup and only initted in the tests it's needed for

        
        let characterDescription = NSEntityDescription.entityForName("Character", inManagedObjectContext: managedObjectContext)
        aCharacter = GameCharacter(entity: characterDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        let campaignDescription = NSEntityDescription.entityForName("Campaign", inManagedObjectContext: managedObjectContext)
        aCampaign = Campaign(entity: campaignDescription!, insertIntoManagedObjectContext: managedObjectContext)
        


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
        XCTAssertNotNil(aCampaign, "Could not create Campaign")
    }
    
    
    func testCampaignCanHaveName() {
        aCampaign.name = "The Eyes of the Overworld"
        XCTAssertEqual(aCampaign.name, "The Eyes of the Overworld", "Campaign name cannot be set")
    }
    
    func testCampaignCanAddPlayer() {
        aCampaign.addPlayer(aPlayer)
        XCTAssertTrue(aCampaign.mutableSetValueForKey("players").containsObject(aPlayer), "Player not successfully added to Campaign")
    }
    
    func testCampaignCanListPlayers() {
        aCampaign.addPlayer(aPlayer)
        aCampaign.addPlayer(aSecondPlayer)
        XCTAssertTrue(aCampaign.listPlayers().contains(aSecondPlayer), "Campaign is not returning list of players")
    }

    func testCampaignHasCreationDate() {
        // there's probably a better way of testing the date can be set correctly
        XCTAssertTrue(aPlayer.dateCreated?.timeIntervalSinceReferenceDate < NSDate().timeIntervalSinceReferenceDate , "It was somehow created in the future")    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
