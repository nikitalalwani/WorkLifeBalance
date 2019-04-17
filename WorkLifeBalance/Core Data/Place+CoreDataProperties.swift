//
//  Place+CoreDataProperties.swift
//  WorkLifeBalance
//
//  Created by nikita lalwani on 4/15/19.
//  Copyright © 2019 nikita lalwani. All rights reserved.
//
//

import Foundation
import CoreData


extension Place {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Place> {
        return NSFetchRequest<Place>(entityName: "Place")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var person: Person?

}
