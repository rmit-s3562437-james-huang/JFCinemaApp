//
//  helper.swift
//  JFCinemaApp
//
//  Created by James Huang on 21/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

func generateRandomData() -> [[UIButton]] {
    let numberOfRows = 5
    let numberOfItemsPerRow = 5
    
    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRow).map { _ in UIButton.timestamp() }
    }
}

extension UIButton {
    
    class func timestamp() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        // issues with dissapearing cells might revolve around arc function
        let hour = arc4random_uniform(12)
        let minute = arc4random_uniform(60)
        button.setTitle("\(hour) : \(minute)", for: .normal)
        return button
    }
}
