//
//  EditTicketViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 1/10/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

protocol ClassEditTicketDelegate: class {
    func updateTicket(_ ticket: mTicket)
}

class EditTicketViewController: UIViewController {

    weak var delegate: ClassEditTicketDelegate?
    
    var selectedTicket: mTicket!
    
    var childPrice: Double = 9.50
    var concessionPrice: Double = 12.0
    var adultPrice: Double = 14.0
    var childTicket: Int = 0
    var concessionTicket: Int = 0
    var adultTicket: Int = 0
    
    @IBOutlet weak var movieTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text = selectedTicket.movieTitle!
        childTicket = Int(selectedTicket.child)
        concessionTicket = Int(selectedTicket.concession)
        adultTicket = Int(selectedTicket.adult)
        childrenTotal.text = String(selectedTicket.child)
        concessionTotal.text = String(selectedTicket.concession)
        adultTotal.text = String(selectedTicket.adult)
    }
    
    @IBOutlet weak var adultTotal: UILabel!
    @IBOutlet weak var concessionTotal: UILabel!
    @IBOutlet weak var childrenTotal: UILabel!
    
    @IBAction func childStepper(_ sender: UIStepper) {
        childTicket = Int(sender.value)
        childrenTotal.text = String(childTicket)
    }
    
    @IBAction func adultStepper(_ sender: UIStepper) {
        adultTicket = Int(sender.value)
        adultTotal.text = String(adultTicket)
    }
    
    @IBAction func concessionStepper(_ sender: UIStepper) {
        concessionTicket = Int(sender.value)
        concessionTotal.text = String(concessionTicket)
    }
    
    @IBAction func editDone(_ sender: Any) {
        let totalPrice = (childPrice * Double(childTicket)) + (concessionPrice * Double(concessionTicket)) + (adultPrice * Double(adultTicket))
        
        selectedTicket.adult = Int16(adultTicket)
        selectedTicket.child = Int16(childTicket)
        selectedTicket.concession = Int16(concessionTicket)
        selectedTicket.price = Int16(totalPrice)
        
        delegate?.updateTicket(selectedTicket)
        navigationController?.dismiss(animated: true)
    }

    
}
