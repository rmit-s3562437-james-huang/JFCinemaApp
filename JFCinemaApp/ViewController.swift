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
    
    @IBOutlet weak var mainController: UITableView!
    
    var model = Singleton.getInstance.movieList.naturalOrder()

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainController.separatorStyle = UITableViewCellSeparatorStyle.none
        self.mainController.allowsSelection = false
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        
        let movie: Movies = model[indexPath.item]
        
        cell.myImage.image = movie.backdrop
        cell.myLabel.text = movie.title
    
        return cell
    }
    
    
}
