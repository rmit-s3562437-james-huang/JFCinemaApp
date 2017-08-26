//
//  Singleton.swift
//  JFCinemaApp
//
//  Created by James Huang on 21/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit

final class Singleton {
    
    var movieList: MovieList
    var tickets: [Ticket] = []
    var ticket: Ticket
    private init() {
        movieList = MovieList()
        ticket = Ticket()

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
