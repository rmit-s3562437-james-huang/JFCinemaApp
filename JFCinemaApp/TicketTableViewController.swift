//
//  TicketTableViewController.swift
//  JFCinemaApp
//
//  Created by Forest Xiang on 25/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit
import Foundation

class TicketTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ClassEditTicketDelegate {
    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet weak var myTicket: UITableView!
    
    var modelTicket: [Ticket]?
    let messageLabel = UILabel()
    var userTicketArray: [Any]?
    var selectedTicket: mTicket?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        modelTicket = Singleton.getInstance.tickets
        let currentUser = CrudAccess.sharedInstance.retrieveUserById((Singleton.getInstance.currentUser?.id)!)
        let set = currentUser.tickets
        userTicketArray = set?.allObjects
        myTableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let currentUser = CrudAccess.sharedInstance.retrieveUserById((Singleton.getInstance.currentUser?.id)!)
        let set = currentUser.tickets
        userTicketArray = set?.allObjects
        myTableView.reloadData()
    }
    
    func updateTicket(_ userTicket: mTicket) {
        let currentUser = CrudAccess.sharedInstance.retrieveUserById((Singleton.getInstance.currentUser?.id)!)
        for ticket in currentUser.tickets! {
            if (ticket as? mTicket)?.id == userTicket.id {
                (ticket as? mTicket)?.adult = Int16(userTicket.adult)
                (ticket as? mTicket)?.child = userTicket.child
                (ticket as? mTicket)?.concession = userTicket.concession
                (ticket as? mTicket)?.price = userTicket.price
                CrudAccess.sharedInstance.updateEntity()
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (userTicketArray?.count)!
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as! TicketTableViewCell
        
        //let newTicket: Ticket = modelTicket![indexPath.item]
        let userTicket: mTicket = userTicketArray![indexPath.item] as! mTicket
        
        cell.movieTitle.text = userTicket.movieTitle
        cell.movieSession.text = userTicket.session
        cell.childQty.text = String(userTicket.child)
        cell.concessionQty.text = String(userTicket.concession)
        cell.adultQty.text = String(userTicket.adult)
        cell.priceLbl.text = "$"+String(userTicket.price)
        
        
        return cell
    }

    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        selectedTicket = (userTicketArray![indexPath.item] as? mTicket)
        performSegue(withIdentifier: "editTicket", sender: selectedTicket)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "editTicket" {
//            if let nv = segue.destination as? EditTicketViewController {
//                nv.selectedTicket = self.selectedTicket
//            }
//        }
        
        if let nav = segue.destination as? UINavigationController, let editTicket = nav.topViewController as? EditTicketViewController {
            editTicket.selectedTicket = self.selectedTicket
            editTicket.delegate = self
        }
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
       
        let currentUser = CrudAccess.sharedInstance.retrieveUserById((Singleton.getInstance.currentUser?.id)!)
        let userTicket: mTicket = userTicketArray![indexPath.item] as! mTicket
        currentUser.removeFromTickets(userTicket)
        userTicketArray?.remove(at: indexPath.item)
        
        CrudAccess.sharedInstance.updateEntity()
        
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    
}
