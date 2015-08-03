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

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCampaignCanBeCreated() {
        let aCampaign = Campaign()
        XCTAssertNotNil(aCampaign, "Campaign cannot be created")
    }
    
    func testCampaignCanHaveName() {
        let aCampaign = Campaign()
        aCampaign.name = "The Eyes of the Overworld"
        XCTAssertEqual(aCampaign.name, "The Eyes of the Overworld", "Campaign name cannot be set")
    }
    
    func testCampaignCanHavePlayerCharacter() {
        let aCampaign = Campaign()
        let aCharacter = Character()
        aCampaign.addCharacter (aCharacter, whoseTypeIs: "PC")
        XCTAssertTrue(aCampaign.isCharacterAPC (aCharacter), "PC is not showing up as a PC")
    }

    func testNPCisNotRecordedAsPC() {
        let aCampaign = Campaign()
        let aCharacter = Character()
        aCampaign.addCharacter (aCharacter, whoseTypeIs: "NPC")
        XCTAssertFalse(aCampaign.isCharacterAPC (aCharacter), "PC is not showing up as a PC")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
