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

class PlayerTest: XCTestCase {
    
    var aPlayer: Player!
   
    override func setUp() {
        super.setUp()
        
        // set up our core data, and create a player entry
        let managedObjectContext = CoreDataHelper.setUpInMemoryManagedObjectContext()
        let entityDescription = NSEntityDescription.entityForName("Player", inManagedObjectContext: managedObjectContext)
        aPlayer = Player(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        aPlayer = nil
        super.tearDown()
    }
    

    func testPlayerExists() {
        XCTAssertNotNil(aPlayer, "Can't create player in Core Data")
    }
    
    func testPlayerHasName() {
 
        aPlayer.name = "Iain Coleman"
        XCTAssertEqual(aPlayer.name, "Iain Coleman", "Can't set player name")
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
