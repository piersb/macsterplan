//
//  Campaign.swift
//  Macsterplan
//
//  Created by Piers Beckley on 03/08/2015.
//  Copyright (c) 2015 Piers Beckley. All rights reserved.
//

import Cocoa

public class Campaign: NSObject {

    public var name: String = ""
    var playerCharacters = Set<Character>()
    
    public func addCharacter (aCharacter: Character, whoseTypeIs: String) {
        if (whoseTypeIs == "PC") {
            playerCharacters.insert(aCharacter)
        }
    }
    
    public func isCharacterAPC (aCharacter:Character) -> Bool {
        if playerCharacters.contains (aCharacter) {
            return true
        }
        return false
    }
    
}
