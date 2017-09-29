//
//  DescViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 24/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class DescViewController: UIViewController {

    var selected: Any!
    
    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var contentClassification: UIImageView!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var classDesc: UILabel!
    @IBOutlet weak var contentDesc: UITextView!
    
    override func viewDidLoad() {
//        self.myTitle.text = selected.title
//        self.myImage.image = selected.backdrop
//        self.rating.text = selected.userRating
//        self.classDesc.text = selected.classification
//        self.contentDesc.text = selected.description
        
        if let movieTitle = (selected as AnyObject).value(forKey: "original_title") as? String {
            self.myTitle.text = movieTitle
        }
        
        if let id = (selected as AnyObject).value(forKey: "id") as? Int {
            Singleton.getInstance.rest.getMovieImage(String(id), moviesImage: self.myImage)
        }
        
        if let rating = (selected as AnyObject).value(forKey: "vote_average") as? Double {
            self.rating.text = String(rating)
        }
        
        if let release = (selected as AnyObject).value(forKey: "release_date") as? String {
            self.classDesc.text = release
        }
        
        if let overview = (selected as AnyObject).value(forKey: "overview") as? String {
            self.contentDesc.text = overview
        }
    }
    
    // Go to sessions
    @IBAction func moveToSessions(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
}
