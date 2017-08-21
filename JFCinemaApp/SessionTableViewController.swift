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
    
    @IBAction func refreshButtonTapped(sender: AnyObject) {
        myTableView.reloadData()
    }
    
    @IBAction func segmentedControlActionChanged(sender: AnyObject) {
        myTableView.reloadData()
    }
    
    let model = generateRandomData()
    let tuesday = generateRandomData()
    var storedOffsets = [Int: CGFloat]()
    var id = ""

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var day_count = 0
        
        switch (segmentedController.selectedSegmentIndex) {
        case 0:
            day_count = model.count
            break
        case 1:
            day_count = tuesday.count
            break
        default:
            break
        }

        return day_count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //myTableView.tag = indexPath.row
        
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
        return model[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        
        switch (segmentedController.selectedSegmentIndex) {
        case 0:
            cell1.backgroundView = model[collectionView.tag][indexPath.item]
            
            cell1.tag = indexPath.item
            
            cell1.backgroundColor = UIColor.gray;
            
            cell1.layer.borderColor = UIColor.black.cgColor
            
            cell1.layer.borderWidth = 1
            
            cell1.layer.cornerRadius = 8
            break;
        case 1:
            cell2.backgroundView = tuesday[collectionView.tag][indexPath.item]
            
            cell2.tag = indexPath.item
            
            cell2.backgroundColor = UIColor.gray;
            
            cell2.layer.borderColor = UIColor.black.cgColor
            
            cell2.layer.borderWidth = 1
            
            cell2.layer.cornerRadius = 8
            break;
        default:
            break;
            
        }
        
        return cell1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
        
        let descViewController = self.storyboard?.instantiateViewController(withIdentifier: "descView") as! DescViewController
        
        descViewController.row = collectionView.tag
        descViewController.path = indexPath
        descViewController.content = (model[collectionView.tag][indexPath.item].titleLabel?.text)
        
        self.navigationController?.pushViewController(descViewController, animated: true)
    }
    
}
