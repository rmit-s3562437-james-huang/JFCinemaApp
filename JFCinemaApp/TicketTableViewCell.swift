//
//  TicketTableViewCell.swift
//  JFCinemaApp
//
//  Created by Forest Xiang on 25/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class TicketTableViewCell: UITableViewCell {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSession: UILabel!
    
    @IBOutlet weak var childQty: UILabel!
    @IBOutlet weak var concessionQty: UILabel!
    @IBOutlet weak var adultQty: UILabel!
    
    @IBOutlet weak var priceLbl: UILabel!
}
