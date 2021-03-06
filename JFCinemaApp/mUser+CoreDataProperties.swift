//
//  mUser+CoreDataProperties.swift
//  JFCinemaApp
//
//  Created by James Huang on 30/9/17.
//  Copyright © 2017 James Huang. All rights reserved.
//
//

import Foundation
import CoreData


extension mUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<mUser> {
        return NSFetchRequest<mUser>(entityName: "User")
    }

    @NSManaged public var id: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var tickets: NSSet?

}

// MARK: Generated accessors for tickets
extension mUser {

    @objc(addTicketsObject:)
    @NSManaged public func addToTickets(_ value: mTicket)

    @objc(removeTicketsObject:)
    @NSManaged public func removeFromTickets(_ value: mTicket)

    @objc(addTickets:)
    @NSManaged public func addToTickets(_ values: NSSet)

    @objc(removeTickets:)
    @NSManaged public func removeFromTickets(_ values: NSSet)

}
