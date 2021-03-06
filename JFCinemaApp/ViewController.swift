//
//  ViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 21/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var rest = Singleton.getInstance.rest
    
    
    @IBOutlet weak var mainController: UITableView!
    
    var model = Singleton.getInstance.movieList.naturalOrder()
    
    // should be of type movie
    var selected: Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainController.separatorStyle = UITableViewCellSeparatorStyle.none
        
        //self.mainController.allowsSelection = false
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        print("TOTAL COUNT")
        print(rest.moviesArray.count)
        return rest.moviesArray.count-1

    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
    
        if let id = (rest.moviesArray[indexPath.item] as AnyObject).value(forKey: "id") as? Int {
            print("my id ----------:")
            rest.getMovieImage(String(id), moviesImage: cell.myImage)
            print(id)
        }
        
        if let movieTitle = (rest.moviesArray[indexPath.item] as AnyObject).value(forKey: "original_title") as? String {
            cell.myLabel.text = movieTitle
        }
        
        cell.layoutIfNeeded()
        cell.myImage.layer.cornerRadius = 8
        cell.myImage.layer.masksToBounds = true
        cell.layer.cornerRadius = 8
   
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        selected = rest.moviesArray[indexPath.item]
        performSegue(withIdentifier: "viewToDesc", sender: selected)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewToDesc" {
            if let nv = segue.destination as? DescViewController {
                nv.selected = selected
            }
        }
    }
}

