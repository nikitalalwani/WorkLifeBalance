//
//  Person+CoreDataProperties.swift
//  
//
//  Created by nikita lalwani on 4/25/19.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var email: String?
    @NSManaged public var isConfigured: Bool
    @NSManaged public var password: String?
    @NSManaged public var normalWorkingHours: Double
    @NSManaged public var days: NSSet?
    @NSManaged public var places: Place?

}

// MARK: Generated accessors for days
extension Person {

    @objc(addDaysObject:)
    @NSManaged public func addToDays(_ value: Day)

    @objc(removeDaysObject:)
    @NSManaged public func removeFromDays(_ value: Day)

    @objc(addDays:)
    @NSManaged public func addToDays(_ values: NSSet)

    @objc(removeDays:)
    @NSManaged public func removeFromDays(_ values: NSSet)

}
