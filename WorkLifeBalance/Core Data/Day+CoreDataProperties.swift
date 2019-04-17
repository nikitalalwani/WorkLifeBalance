//
//  Day+CoreDataProperties.swift
//  WorkLifeBalance
//
//  Created by nikita lalwani on 4/16/19.
//  Copyright © 2019 nikita lalwani. All rights reserved.
//
//

import Foundation
import CoreData


extension Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var arrivalTime: NSDate?
    @NSManaged public var dayOfWeek: Double
    @NSManaged public var departureTime: NSDate?
    @NSManaged public var hoursWorked: Int64
    @NSManaged public var workingHours: Int64
    @NSManaged public var person: Person?

}
