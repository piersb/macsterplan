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
    @NSManaged public var players: Set<Player>

    
    public func addPlayer (aPlayer: Player) {
        players.insert (aPlayer)

    }
    
    
    public func isPlayerInCampaign (aPlayer: Player) -> Bool{
//        return players.contains(aPlayer)
        return true
    }
    
    override public func awakeFromInsert() {
        // awakeFromInsert fires once when the object is created; so this is where we initialize the list of players
        // (overriding init is ...discouraged... for nsmanagedobjects)
        
        super.awakeFromInsert()
        players = Set<Player>() // except the bloody thing vanishes when we hit the addPlayer function!
        
        var error : NSError? = nil
        if !self.managedObjectContext!.save(&error) {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        
    }
    
    override public func awakeFromFetch() {
        super.awakeFromFetch()
        
        
    }
    
    
    
}
