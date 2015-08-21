//
//  Party.swift
//  Macsterplan
//
//  Created by Piers Beckley on 21/08/2015.
//  Copyright (c) 2015 Piers Beckley. All rights reserved.
//

import Foundation
import CoreData

public class Party: NSManagedObject {
    
    @NSManaged public var name: String?
    @NSManaged public var dateCreated: NSDate?
    @NSManaged public var characters: Set<GameCharacter>?
    
    convenience init(context: NSManagedObjectContext) {
        let entityDescription = NSEntityDescription.entityForName("Party", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }
    
   
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.dateCreated = NSDate() //document creation date - we might be able to get this for free somewhere?
        characters = Set<GameCharacter>() // need to initialise the set or we get a runtime crash
        
    }
    
    public func addCharacter (aNewCharacter: GameCharacter) {
        var items = self.mutableSetValueForKey("characters")
        items.addObject(aNewCharacter)
    }
    

}
