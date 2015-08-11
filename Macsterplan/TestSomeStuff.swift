//
//  TestSomeStuff.swift
//  Macsterplan
//
//  Created by Piers Beckley on 11/08/2015.
//  Copyright (c) 2015 Piers Beckley. All rights reserved.
//

import Cocoa
import CoreData

class TestSomeStuff: NSObject {
    
    var aPlayer: Player!
    var aCampaign: Campaign!
    var aCharacter: GameCharacter!

    
     func test() {
        
        // set up our core data, and create player, character, and campaign entries
        let managedObjectContext = setUpInMemoryManagedObjectContext()
        
        let playerDescription = NSEntityDescription.entityForName("Player", inManagedObjectContext: managedObjectContext)
        aPlayer = Player(entity: playerDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        let characterDescription = NSEntityDescription.entityForName("Character", inManagedObjectContext: managedObjectContext)
        aCharacter = GameCharacter(entity: characterDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        let campaignDescription = NSEntityDescription.entityForName("Campaign", inManagedObjectContext: managedObjectContext)
        aCampaign = Campaign(entity: campaignDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
        NSLog("%@", aCampaign.dateCreated)
        println(aCampaign)
        
    }
    
    func testMore() {
        NSLog("%@", aCampaign.dateCreated)
        println(aCampaign)
    }
    
    func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
        
        // we need to create an in memory store to test core data
        let managedObjectModel = NSManagedObjectModel.mergedModelFromBundles([NSBundle.mainBundle()])!
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        persistentStoreCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: nil)
        
        let managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
        return managedObjectContext
    }
    
}
