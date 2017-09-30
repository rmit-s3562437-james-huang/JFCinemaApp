//
//  mTicket+CoreDataProperties.swift
//  JFCinemaApp
//
//  Created by James Huang on 30/9/17.
//  Copyright © 2017 James Huang. All rights reserved.
//
//

import Foundation
import CoreData


extension mTicket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<mTicket> {
        return NSFetchRequest<mTicket>(entityName: "Ticket")
    }

    @NSManaged public var adult: Int16
    @NSManaged public var child: Int16
    @NSManaged public var concession: Int16
    @NSManaged public var id: String?
    @NSManaged public var movieTitle: String?
    @NSManaged public var session: String?
    @NSManaged public var price: Int16
    @NSManaged public var user: mUser?

}
