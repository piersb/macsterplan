//
//  Campaign.swift
//  
//
//  Created by Piers Beckley on 10/08/2015.
//
//

import Foundation
import CoreData

class Campaign: NSManagedObject {

    @NSManaged var character: NSSet
    @NSManaged var player: NSSet

}
