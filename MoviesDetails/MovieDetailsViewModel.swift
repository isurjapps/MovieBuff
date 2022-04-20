//
//  MovieDetailsViewModel.swift
//  MovieBuff
//
//  Created by Prashant Singh on 20/4/22.
//

import Foundation

protocol MovieDetailsViewModel {
    var movie: MovieDetails? { get set }
    var details: [String] { get set }
}

class MovieDetailsViewModelImplementation: MovieDetailsViewModel {
    
    var details = ["Year", "Release Date", "Runtime", "Genre", "Director", "Writer", "Actors", "Language", "Country", "Rating", "Votes"]
    var movie: MovieDetails?
    let na = "N/A"
    
    init(movie: MovieDetails) {
        self.movie = movie
    }
    
    func info(at index: Int) -> String {
        var stringToReturn = ""
        switch index {
        case 0:
            stringToReturn = movie?.Year ?? na
        case 1:
            stringToReturn = movie?.Released ?? na
        case 2:
            stringToReturn = movie?.Runtime ?? na
        case 3:
            stringToReturn = movie?.Genre ?? na
        case 4:
            stringToReturn = movie?.Director ?? na
        case 5:
            stringToReturn = movie?.Writer ?? na
        case 6:
            stringToReturn = movie?.Actors ?? na
        case 7:
            stringToReturn = movie?.Language ?? na
        case 8:
            stringToReturn = movie?.Country ?? na
        case 9:
            stringToReturn = movie?.imdbRating ?? na
        case 10:
            stringToReturn = movie?.imdbVotes ?? na
        default:
            fatalError("Index out of bounds.")
        }
        return stringToReturn
    }
}




