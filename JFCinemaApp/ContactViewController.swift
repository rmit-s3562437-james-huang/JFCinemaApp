//
//  ContactViewController.swift
//  JFCinemaApp
//
//  Created by James Huang on 26/9/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit

class ContactViewController: UIViewController {
    
    let mapView: GMSMapView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -37.8089430, longitude: 144.9651170, zoom: 17.0)
        //        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        //        view = mapView
        
        
        let mapView = GMSMapView.map(withFrame:
            CGRect(x: self.view.frame.size.width/2-(300/2),
                   y: self.view.frame.size.height/2-(195/2)+195,
                   width: 300,
                   height: 195), camera: camera)
        
        self.view.addSubview(mapView)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -37.8089430, longitude: 144.9651170)
        marker.title = "JFCinemas"
        marker.snippet = "Australia"
        marker.map = mapView
        mapView.selectedMarker = marker
    }
    
    // You don't need to modify the default init(nibName:bundle:) method.
    
    
    
}

