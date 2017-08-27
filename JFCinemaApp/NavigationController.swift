//
//  NavigationController.swift
//  JFCinemaApp
//
//  Created by James Huang on 27/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barStyle = UIBarStyle.black
        self.navigationBar.tintColor = UIColor.white
    }
}
