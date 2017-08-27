//
//  SessionTableViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 21/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class SessionTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        self.myTableView.allowsSelection = false
        self.myTableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    @IBAction func refreshButtonTapped(sender: AnyObject) {
        myTableView.reloadData()
    }
    
    @IBAction func segmentedControlActionChanged(sender: AnyObject) {
        myTableView.reloadData()
    }
    
    let model = generateRandomData()
    
    var movieModel = Singleton.getInstance.movieList.naturalOrder()
    
    
    var storedOffsets = [Int: CGFloat]()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SessionTableViewCell
        
        cell.movieTitle.text = movieModel[indexPath.item].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? SessionTableViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? SessionTableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
    
    
}

extension SessionTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return 4
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
            cell1.backgroundView = model[collectionView.tag][indexPath.item]
            
            cell1.tag = indexPath.item
            
            cell1.backgroundColor = UIColor.darkGray;
            
            cell1.layer.borderColor = UIColor.darkGray.cgColor
            
            cell1.layer.borderWidth = 1
            
            cell1.layer.cornerRadius = 4
      
        return cell1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
        
        let bookViewController = self.storyboard?.instantiateViewController(withIdentifier: "descView") as! BookViewController

        bookViewController.movieTitle = movieModel[collectionView.tag].title
        bookViewController.row = collectionView.tag
        bookViewController.path = indexPath
        bookViewController.content = (model[collectionView.tag]           [indexPath.item].titleLabel?.text)

        self.navigationController?.pushViewController(bookViewController, animated: true)
    }
    
}
