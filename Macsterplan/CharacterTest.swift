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

    var aCharacter: GameCharacter!
    
    // setting up our core data variables
    var managedObjectModel: NSManagedObjectModel!
    var persistentStoreCoordinator: NSPersistentStoreCoordinator!
    var managedObjectContext: NSManagedObjectContext!

    
    override func setUp() {
        super.setUp()
        
        // we need to create an in memory store to test core data
        managedObjectModel = NSManagedObjectModel.mergedModelFromBundles([NSBundle.mainBundle()])!
        
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        persistentStoreCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: nil)
        
        managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
        
        // and here are our entities
        let entityDescription = NSEntityDescription.entityForName("Character", inManagedObjectContext: managedObjectContext)
                            // Can't see any way to rename the entity name from Character (reserved in most other places in Swift, hence less than ideal) to GameCharacter...
        aCharacter = GameCharacter(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
    }
    
    override func tearDown() {

        aCharacter = nil
        
        // tear down our core data stack
        managedObjectModel = nil
        persistentStoreCoordinator = nil
        managedObjectContext = nil

        
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
//
//    func testCharacterCanHavePlayer() {
//        aCharacter.player = "Piers"
//        XCTAssertEqual(aCharacter.player, "Piers", "Cannot give Character to Player")
//    }
//    
//    func testCharacterCanBePC() {
//        aCharacter.type = .PC
//        XCTAssertEqual(aCharacter.type, .PC, "Cannot set Character as PC")
//    }
//    
//    func testCharacterCanBeNPC() {
//        aCharacter.type = .NPC
//        XCTAssertEqual(aCharacter.type, .NPC, "Cannot set Character as NPC")
//    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
