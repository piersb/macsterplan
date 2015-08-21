//
//  MacsterplanTests.swift
//  MacsterplanTests
//
//  Created by Piers Beckley on 29/06/2015.
//  Copyright (c) 2015 Piers Beckley. All rights reserved.
//

import Cocoa
import XCTest

class MacsterplanTests: XCTestCase {
    
    // setting up our core data variables for the NSManagedObject Stack
    var managedObjectModel: NSManagedObjectModel!
    var persistentStoreCoordinator: NSPersistentStoreCoordinator!
    var managedObjectContext: NSManagedObjectContext!
    var playerDescription: NSEntityDescription!
    
   
    override func setUp() {
        super.setUp()

        
        // we need to create an in memory store to test core data
        managedObjectModel = NSManagedObjectModel.mergedModelFromBundles([NSBundle.mainBundle()])!
        
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        persistentStoreCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil, error: nil)
        
        managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        

        
    }
    
    override func tearDown() {
        // tear down our core data stack
        
        managedObjectModel = nil
        persistentStoreCoordinator = nil
        managedObjectContext = nil
        playerDescription = nil
        
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
