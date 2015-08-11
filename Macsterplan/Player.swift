//
//  Player.swift
//  
//
//  Created by Piers Beckley on 10/08/2015.
//
//

import Foundation
import CoreData

public class Player: NSManagedObject {

    @NSManaged public var name: String?
    @NSManaged public var dateCreated: NSDate?
    
    convenience init(context: NSManagedObjectContext) {
        // may be necessary to avoid the nil-return bug described at http://www.jessesquires.com/swift-coredata-and-testing/
        let entityDescription = NSEntityDescription.entityForName("Campaign", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.dateCreated = NSDate()
        
    }
    
}
