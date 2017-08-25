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
    
    var ticket: Ticket!
    var myString: String!
    var modelTicket = Singleton.getInstance.tickets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    @IBOutlet weak var myTicket: UITableView!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelTicket.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as! TicketTableViewCell
        
        let newTicket: Ticket = modelTicket[indexPath.item]
        
        cell.movieTitle.text = newTicket.movieName
        cell.movieSession.text = newTicket.session
        cell.childQty.text = String(newTicket.childTicketNum)
        cell.concessionQty.text = String(newTicket.concessionTicketNum)
        cell.adultQty.text = String(newTicket.adultTicketNum)
        cell.priceLbl.text = "$"+String(newTicket.totalPrice)
        
        return cell
    }

}
