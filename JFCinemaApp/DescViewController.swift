//
//  DescViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 21/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//


import UIKit

class DescViewController: UIViewController {
    
    var row: Int!
    var path: IndexPath!
    var content: String!
    

    @IBOutlet weak var childTickets: UILabel!
    @IBOutlet weak var concessionTickets: UILabel!
    @IBOutlet weak var adultTickets: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Collection view at row \(row!) selected index path \(path!)")
        self.timeLabel.text = "\(content!)"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Stepper funcs
    @IBAction func childStepper(_ sender: UIStepper) {
        let intChildTickets:Int = Int(sender.value)
        childTickets.text = String(intChildTickets)
    }
    
    @IBAction func concessionStepper(_ sender: UIStepper) {
        let intChildTickets:Int = Int(sender.value)
        concessionTickets.text = String(intChildTickets)
    }

    
    @IBAction func adultStepper(_ sender: UIStepper) {
        let intChildTickets:Int = Int(sender.value)
        adultTickets.text = String(intChildTickets)
    }
    
    
}
