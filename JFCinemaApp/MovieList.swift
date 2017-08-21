//
//  MovieModel.swift
//  JFCinemaApp
//
//  Created by James Huang on 21/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import UIKit
    
struct MovieList {
    
    var movieList: [Movies]
    
    init()
    {
        movieList = Movies.getMovieList()
    }
    
    mutating func naturalOrder()->[Movies]
    {
        let movieList:[Movies] = Movies.getMovieList()
        return movieList
    }
}
