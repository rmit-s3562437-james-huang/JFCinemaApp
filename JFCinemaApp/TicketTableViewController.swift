//
//  TicketTableViewController.swift
//  JFCinemaApp
//
//  Created by Forest Xiang on 25/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit
import Foundation

class TicketTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var myTableView: UITableView!
    @IBOutlet weak var myTicket: UITableView!
    
    var modelTicket: [Ticket]?
    let messageLabel = UILabel()
    var userTicketArray: [Any]?
    
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
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if modelTicket!.count > 0 {
//            messageLabel.isHidden = true
//            return modelTicket!.count
//        } else {
//
//            messageLabel.text = "You currently don't have any tickets yet."
//            messageLabel.textColor = UIColor.black
//            messageLabel.numberOfLines = 0;
//            messageLabel.textAlignment = .center
//            messageLabel.sizeToFit()
//            messageLabel.isHidden = false
//
//            myTableView.backgroundView = messageLabel
//
//            return 0
//        }
//
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
}
