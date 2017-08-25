//
//  Singleton.swift
//  JFCinemaApp
//
//  Created by James Huang on 21/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

class Singleton {
    
    var movieList: MovieList
    var tickets: [Ticket] = []
    
    init() {
        movieList = MovieList()
    }
    
    private struct Static {
        static var instance: Singleton?
    }
    
    class var getInstance: Singleton {
        if !(Static.instance != nil)
        {
            Static.instance = Singleton()
        }
        return Static.instance!
    }
    
}
