//
//  DescViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 21/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//


import UIKit

class BookViewController: UIViewController, UITabBarControllerDelegate {
    
    var movieTitle: String!
    var row: Int!
    var path: IndexPath!
    var content: String!
    
    var childTicket: Int = 0
    var concessionTicket: Int = 0
    var adultTicket: Int = 0
    
    var viewController: UIViewController?
    
    var myTicket = Ticket()

    @IBOutlet weak var childTickets: UILabel!
    @IBOutlet weak var concessionTickets: UILabel!
    @IBOutlet weak var adultTickets: UILabel!
    @IBOutlet weak var myHeading: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Collection view at row \(row!) selected index path \(path!)")
        self.myHeading.text = movieTitle!
        self.timeLabel.text = content!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Stepper funcs
    @IBAction func childStepper(_ sender: UIStepper) {
        childTicket = Int(sender.value)
        childTickets.text = String(childTicket)
    }
    
    @IBAction func concessionStepper(_ sender: UIStepper) {
        concessionTicket = Int(sender.value)
        concessionTickets.text = String(concessionTicket)
    }

    @IBAction func adultStepper(_ sender: UIStepper) {
        adultTicket = Int(sender.value)
        adultTickets.text = String(adultTicket)
    }
    
    @IBAction func confirmTicket(_ sender: UIButton) {
        
        myTicket = Ticket(title: movieTitle, sess: content, child: childTicket, concess: concessionTicket, adult: adultTicket)
        Singleton.getInstance.tickets.append(myTicket)
        _ = navigationController?.popToRootViewController(animated: true)

        tabBarController?.selectedIndex = 3
        
    }
 
}
