//
//  Campaign.swift
//  
//
//  Created by Piers Beckley on 10/08/2015.
//
//

import Foundation
import CoreData

public class Campaign: NSManagedObject {

    @NSManaged public var name: String
    @NSManaged public var character: NSSet
    @NSManaged public var players: Set<Player>?
    @NSManaged public var dateCreated: NSDate


        
    convenience init(context: NSManagedObjectContext) {
        // may be necessary to avoid the nil-return bug described at http://www.jessesquires.com/swift-coredata-and-testing/
        let entityDescription = NSEntityDescription.entityForName("Campaign", inManagedObjectContext: context)!
        self.init(entity: entityDescription, insertIntoManagedObjectContext: context)
    }



    func isPlayerInCampaign (aPlayer: Player) -> Bool {
//        return players.contains(aPlayer)
    return true
    }

    public func addPlayer (aNewPlayer: Player) {
        var items = self.mutableSetValueForKey("players");
        items.addObject(aNewPlayer)
    }

    public func listPlayers () -> Set<Player> {
        return players!
    }
    
    func removeList(values: NSSet) {
        var items = self.mutableSetValueForKey("lists");
        for value in values {
            items.removeObject(value)
        }
    }
        
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.dateCreated = NSDate()
        players = Set<Player>()
        
        
    }
    
    public override func awakeFromFetch() {
        super.awakeFromFetch()
        println("awaking from fetch")
    
        
    }
    
}