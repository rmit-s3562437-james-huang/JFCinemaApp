//
//  SessionTableViewCell.swift
//  JFCinemaApp
//
//  Created by James Huang on 21/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class SessionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    /** D type confroms to both the datasource and delagate protocols **/
    func setCollectionViewDataSourceDelegate <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (_ dataSourceDelegate: D, forRow row: Int) {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}
