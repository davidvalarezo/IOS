//
//  Book.swift
//  BookaFilmity
//
//  Created by labdisca on 18/12/2019.
//  Copyright © 2019 UPV. All rights reserved.
//

import Foundation

struct Book: Codable {
    var name : String
    var autor : String
    var genre : BookGenre
    var anio : Int
    
    enum BookGenre : Int, Codable{
        case action = 0, terror, adeventure, fantasy, sciencefiction, romance, comedy, mistery
        
    }
}

 
