//
//  Movie.swift
//  Flixr
//
//  Created by Joshua Madrigal on 1/29/20.
//  Copyright © 2020 Joshua Madrigal. All rights reserved.
//

import Foundation


struct Movie {
    
    let name: String
    let rating: Int
    let releaseData: String?
    
    init?(dict: [String: String]) {
        return nil
    } // end init?
    
    init(name: String, rating: Int, releaseDate: String) {
        self.name = name
        self.rating = rating
        self.releaseData = releaseDate
    } // end init
    
} // end Movie
