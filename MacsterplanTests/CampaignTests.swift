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
    
    var aCampaign: Campaign!
    var aCharacter: gameCharacter!
    var aSecondCharacter: gameCharacter!
    
    override func setUp() {
        super.setUp()
        self.aCampaign = Campaign()
        self.aCharacter = gameCharacter()
        self.aSecondCharacter = gameCharacter()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCampaignCanBeCreated() {

        XCTAssertNotNil(aCampaign, "Campaign cannot be created")
    }
    
    func testCampaignCanHaveName() {

        aCampaign.name = "The Eyes of the Overworld"
        XCTAssertEqual(aCampaign.name, "The Eyes of the Overworld", "Campaign name cannot be set")
    }
    
    func testCampaignCanHavePlayerCharacter() {

        aCampaign.addCharacter (aCharacter, whoseTypeIs: "PC")
        aCampaign.addCharacter(aSecondCharacter, whoseTypeIs: "NPC")
        XCTAssertTrue(aCampaign.isCharacterAPC (aCharacter), "PC is not showing up as a PC")
        XCTAssertFalse(aCampaign.isCharacterAPC(aSecondCharacter), "NPC is showing up as PC")
    }

    func testNPCisNotRecordedAsPC() {

        let aCharacter = gameCharacter()
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
