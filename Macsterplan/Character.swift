//
//  Character.swift
//  
//
//  Created by Piers Beckley on 10/08/2015.
//
//

import Foundation
import CoreData

public class Character: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var bio: String

}
