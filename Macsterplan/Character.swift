//
//  Character.swift
//  
//
//  Created by Piers Beckley on 10/08/2015.
//
//

import Foundation
import CoreData

public class GameCharacter: NSManagedObject {

    @NSManaged public var name: String?
    @NSManaged public var bio: String?
    @NSManaged public var characterType: String?
    @NSManaged public var player: Player?
    @NSManaged public var party: Party?

    convenience init(context: NSManagedObjectContext) {
        // may be necessary to avoid the nil-return bug described at http://www.jessesquires.com/swift-coredata-and-testing/
        let entityDescription = NSEntityDescription.entityForName("Character", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }
    
    
}
