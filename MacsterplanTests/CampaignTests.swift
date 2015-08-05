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
    var aPlayer: Player!
    
    override func setUp() {
        super.setUp()
        self.aCampaign = Campaign()
        self.aCharacter = gameCharacter()
        self.aPlayer = Player()

    }
    
    override func tearDown() {
        
        self.aCampaign = nil
        self.aCharacter = nil
        self.aPlayer = nil

        
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
        XCTAssertTrue(aCampaign.isCharacterAPC (aCharacter), "PC is not showing up as a PC")
    }
    
    func testCampaignCanHaveNonPlayerCharacter() {
        aCampaign.addCharacter(aCharacter, whoseTypeIs: "NPC")
        XCTAssertFalse(aCampaign.isCharacterAPC(aCharacter), "NPC is showing up as PC")
    }

    
    func testCampaignCanAddPlayer() {
        aCampaign.addPlayer(aPlayer)
        aCampaign.isPlayerInCampaign(aPlayer)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
