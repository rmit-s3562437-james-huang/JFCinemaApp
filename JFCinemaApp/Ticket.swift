//
//  Ticket.swift
//  JFCinemaApp
//
//  Created by Forest Xiang on 25/8/17.
//  Copyright © 2017 James Huang. All rights reserved.
//

import Foundation

var childPrice: Double = 9.50
var concessionPrice: Double = 12.0
var adultPrice: Double = 14.0

struct Ticket {
    var movieName: String!
    var session: String!
    
    var childTicketNum: Int!
    var concessionTicketNum: Int!
    var adultTicketNum: Int!
    
    var totalPrice: Double!
    
    init(title:String!, sess: String!, child: Int!, concess: Int!, adult: Int!) {
        movieName = title
        session = sess
        childTicketNum = child
        concessionTicketNum = concess
        adultTicketNum = adult
        
        totalPrice = (childPrice * Double(childTicketNum)) + (concessionPrice * Double(concessionTicketNum)) + (adultPrice * Double(adultTicketNum))
    }
    
}



