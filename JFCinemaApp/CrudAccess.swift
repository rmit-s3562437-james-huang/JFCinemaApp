//
//  CrudAccess.swift
//  JFCinemaApp
//
//  Created by James Huang on 28/9/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CrudAccess {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var managedContext: NSManagedObjectContext {
        get {
            return appDelegate.persistentContainer.viewContext
        }
    }

    var tickets: [mTicket] = []
    var users: [mUser] = []
    
    func updateEntity() {
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    func deleteUser (_ indexPath: IndexPath) {
        let user = users[indexPath.item]
        users.remove(at: indexPath.item)
        managedContext.delete(user)
        updateEntity()
    }
    
    func deleteTicket (_ indexPath: IndexPath) {
        let ticket = tickets[indexPath.item]
        tickets.remove(at: indexPath.item)
        managedContext.delete(ticket)
        updateEntity()
    }
    
    func createTicket (id: String, session: String , title: String, adult: Int, child: Int, concession: Int, existing: mTicket?) {
        let entity = NSEntityDescription.entity(forEntityName: "Ticket" , in: managedContext)!
        
        if let _ = existing
        {
            existing!.id = id
            existing!.session = session
            existing!.movieTitle = title
            existing!.adult = Int16(adult)
            existing!.child = Int16(child)
            existing!.concession = Int16(concession)
        } else {
            let ticket = NSManagedObject (entity: entity, insertInto: managedContext)
            
            ticket.setValue(id, forKeyPath: "id")
            ticket.setValue(session, forKeyPath: "session")
            ticket.setValue(title, forKeyPath: "movieTitle")
            ticket.setValue(child, forKeyPath: "child")
            ticket.setValue(concession, forKeyPath: "concession")
            ticket.setValue(adult, forKeyPath: "adult")
            tickets.append(ticket as! mTicket)
        }
        updateEntity()
    }
    
    func createUser (id: String, username: String , password: String, existing: mUser?) {
        let entity = NSEntityDescription.entity(forEntityName: "User" , in: managedContext)!
        
        if let _ = existing
        {
            existing!.id = id
            existing!.username = username
            existing!.password = password
        } else {
            let user = NSManagedObject (entity: entity, insertInto: managedContext)
            
            user.setValue(id, forKeyPath: "id")
            user.setValue(username, forKeyPath: "username")
            user.setValue(password, forKeyPath: "password")
            users.append(user as! mUser)
        }
        updateEntity()
    }
    
    private func getEntitiesFromCoreData() {
        let fetchUsers: NSFetchRequest<mUser> = mUser.fetchRequest()
        let fetchTickets: NSFetchRequest<mTicket> = mTicket.fetchRequest()
        do {
            users = try managedContext.fetch(fetchUsers)
            tickets = try managedContext.fetch(fetchTickets)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func retrieveTicket (_ indexPath: IndexPath) -> mTicket
    {
        return tickets[indexPath.row]
    }
   
    func retrieveUser (_ indexPath: IndexPath) -> mUser
    {
        return users[indexPath.row]
    }
    
    private init() {
        getEntitiesFromCoreData()
    }
    
    fileprivate struct Static {
        static var instance: CrudAccess?
    }
    
    class var sharedInstance: CrudAccess {
        if (Static.instance == nil) {
            Static.instance = CrudAccess()
        }
        return Static.instance!
    }
    
}
