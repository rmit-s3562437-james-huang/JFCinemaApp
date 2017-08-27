//
//  FeaturedViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 21/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var FeaturedCollectionView: UICollectionView!
    
    var model = Singleton.getInstance.movieList.naturalOrder()
    
    var selected: Movies?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "featured_cell", for: indexPath) as! FeaturedCollectionViewCell
        
        // set images
        cell.sessionImageView.image = model[indexPath.row].sessionImg
        cell.sessionImageView.layer.cornerRadius = 2
        cell.sessionImageView.layer.masksToBounds = true
        cell.sessionImageView.layer.borderColor = UIColor.red.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        selected = model[indexPath.item]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "featToDesc" {
            if let nv = segue.destination as? DescViewController {
                nv.selected = selected
            }
        }
    }
    
    
}
