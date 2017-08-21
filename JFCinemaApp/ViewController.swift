//
//  ViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 21/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var mainController: UITableView!
    
    let backdrop_images = ["dunkirk_backdrop", "minions_backdrop", "spiderman_backdrop", "valerian_backdrop"];
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return backdrop_images.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        cell.myImage.image = UIImage(named: (backdrop_images[indexPath.row] + ".jpg"))
        cell.myLabel.text = backdrop_images[indexPath.row]
        
        return cell
    }
    
}
