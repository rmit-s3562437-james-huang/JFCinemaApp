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
            }
        }
    }
    
    var description: String
    {
        get
        {
            switch self {
            case .minions: return "Minions Stuart, Kevin and Bob are recruited by Scarlet Overkill, a super-villain who, alongside her inventor husband Herb, hatches a plot to take over the world."
            case .dunkirk: return "Miraculous evacuation of Allied soldiers from Belgium, Britain, Canada, and France, who were cut off and surrounded by the German army from the beaches and harbor of Dunkirk, France, between May 26 and June 04, 1940, during Battle of France in World War II."
            case .spiderman: return "Following the events of Captain America: Civil War, Peter Parker, with the help of his mentor Tony Stark, tries to balance his life as an ordinary high school student in Queens, New York City, with fighting crime as his superhero alter ego Spider-Man as a new threat, the Vulture, emerges."
            case .valerian: return "In the 28th century, Valerian and Laureline are special operatives charged with keeping order throughout the human territories. On assignment from the Minister of Defense, the two undertake a mission to Alpha, an ever-expanding metropolis where species from across the universe have converged over centuries to share knowledge, intelligence, and cultures. At the center of Alpha is a mysterious dark force which threatens the peaceful existence of the City of a Thousand Planets, and Valerian and Laureline must race to identify the menace and safeguard not just Alpha, but the future of the universe."
            }
        }
    }
    
    var classification: String
    {
        get
        {
            switch self {
            case .minions: return "PG"
            case .dunkirk: return "PG-13"
            case .spiderman: return "PG-13"
            case .valerian: return "PG-13"
            }
        }
    }
    
    var userRating: String
    {
        get
        {
            switch self {
            case .minions: return "64%"
            case .dunkirk: return "73%"
            case .spiderman: return "73%"
            case .valerian: return "68%"
            }
        }
    }
    
    static func getMovieList() -> [Movies]
    {
        return [minions, spiderman, dunkirk, valerian]
    }
    
    
}
