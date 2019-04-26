//
//  Day+CoreDataProperties.swift
//  
//
//  Created by nikita lalwani on 4/25/19.
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
    @NSManaged public var endTime: NSDate?
    @NSManaged public var hoursWorked: Double
    @NSManaged public var startTime: NSDate?
    @NSManaged public var person: Person?

}
