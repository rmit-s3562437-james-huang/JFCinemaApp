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

    var modelTicket: [Ticket]?
    
//    override func viewWillAppear(_ animated: Bool) {
//        modelTicket = Singleton.getInstance.tickets
//    }
    @IBOutlet weak var myTicket: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.separatorStyle = UITableViewCellSeparatorStyle.none

        modelTicket = Singleton.getInstance.tickets
        myTableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        modelTicket = Singleton.getInstance.tickets
        myTableView.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(modelTicket!.count)
        return modelTicket!.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCell", for: indexPath) as! TicketTableViewCell
        
        let newTicket: Ticket = modelTicket![indexPath.item]
        
        cell.movieTitle.text = newTicket.movieName
        cell.movieSession.text = newTicket.session
        cell.childQty.text = String(newTicket.childTicketNum)
        cell.concessionQty.text = String(newTicket.concessionTicketNum)
        cell.adultQty.text = String(newTicket.adultTicketNum)
        cell.priceLbl.text = "$"+String(newTicket.totalPrice)
        
        return cell
    }
    
    
    
}
