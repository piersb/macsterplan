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
    @NSManaged public var player: NSSet

}
