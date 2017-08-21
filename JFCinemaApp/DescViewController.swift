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
    
}
