//
//  DescViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 24/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class DescViewController: UIViewController {

    var selected: String!
    
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var contentClassification: UIImageView!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var classDesc: UILabel!
    @IBOutlet weak var contentDesc: UITextView!
    
    override func viewDidLoad() {
        self.myTitle.text = selected!
    }
    
    // Go to sessions
    @IBAction func moveToSessions(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
}
