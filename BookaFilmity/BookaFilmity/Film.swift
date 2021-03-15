//
//  Film.swift
//  BookaFilmity
//
//  Created by labdisca on 18/12/2019.
//  Copyright © 2019 UPV. All rights reserved.
//

import Foundation

struct Film: Codable {
    var name: String
    var director: [String]
    var cast: [String]
    var anio: Int
}
