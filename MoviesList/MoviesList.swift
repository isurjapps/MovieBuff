//
//  MoviesList.swift
//  MovieBuff
//
//  Created by Prashant Singh on 20/4/22.
//

import Foundation

struct Result: Codable {
    var Search: [Movie]?
}

struct Movie: Codable {
    var imdbID: String?
    var Title: String?
    var Year: String?
    var Poster: String?
}
