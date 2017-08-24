//
//  File.swift
//  JFCinemaApp
//
//  Created by James Huang on 22/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

enum Movies: Int {
    
    case minions = 1, spiderman, dunkirk, valerian
    
    init()
    {
        self = .minions
    }
    
    init?(number: Int)
    {
        switch number
        {
        case 1: self = .minions
        case 2: self = .spiderman
        case 3: self = .dunkirk
        case 4: self = .valerian
        default:
            return nil
        }
    }
    
    var title: String
    {
        get
        {
            switch self {
            case .minions: return "Minions"
            case .dunkirk: return "Dunkirk"
            case .spiderman: return "Spiderman Homecoming"
            case .valerian: return "Valerian"
            default:
                return "Minions"
            }
        }
    }
    
    var sessionImg: UIImage
    {
        get
        {
            switch self {
            case .minions: return UIImage(named: "minions.jpg")!
            case .dunkirk: return UIImage(named: "dunkirk.jpg")!
            case .spiderman: return UIImage(named: "spiderman.jpg")!
            case .valerian: return UIImage(named: "valerian.jpg")!
            default:
                return UIImage(named: "minions.jpg")!
            }
        }
    }
    
    var backdrop: UIImage
    {
        get
        {
            switch self {
            case .minions: return UIImage(named: "minions_backdrop.jpg")!
            case .dunkirk: return UIImage(named: "dunkirk_backdrop.jpg")!
            case .spiderman: return UIImage(named: "spiderman_backdrop.jpg")!
            case .valerian: return UIImage(named: "valerian_backdrop.jpg")!
            default:
                return UIImage(named: "minions_backdrop.jpg")!
            }
        }
    }
    
    static func getMovieList() -> [Movies]
    {
        return [minions, spiderman, dunkirk, valerian]
    }
    
    
}
