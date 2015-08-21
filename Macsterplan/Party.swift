//
//  Party.swift
//  Macsterplan
//
//  Created by Piers Beckley on 21/08/2015.
//  Copyright (c) 2015 Piers Beckley. All rights reserved.
//

import Cocoa

public class Party: NSManagedObject {
    
    @NSManaged public var name: String?
    @NSManaged public var dateCreated: NSDate?
    @NSManaged public var characters: Set<GameCharacter>?
   
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.dateCreated = NSDate() //document creation date - we might be able to get this for free somewhere?
        
    }
    
}
