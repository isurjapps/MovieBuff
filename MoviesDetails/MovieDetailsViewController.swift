//
//  MovieDetailsViewController.swift
//  MovieBuff
//
//  Created by Prashant Singh on 20/4/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var moviewDetailsViewModel: MovieDetailsViewModel!
    let contentView = MovieDetailsView()

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayElements()
       
        
   
    }
    
    override func loadView() {
        view = contentView
    }
    
    private func displayElements() {
        contentView.moviePoster.loadFrom(URLAddress: moviewDetailsViewModel.movie?.Poster ?? "")
        contentView.movieTitle.text = moviewDetailsViewModel.movie?.Title
        contentView.movieYear.text = moviewDetailsViewModel.movie?.Year
        contentView.movieCategory.text = moviewDetailsViewModel.movie?.Genre
        contentView.movieRunTime.text = moviewDetailsViewModel.movie?.Runtime
        contentView.movieRating.text = moviewDetailsViewModel.movie?.imdbRating
        contentView.movieSynopsis.text = moviewDetailsViewModel.movie?.Plot
        contentView.movieScore.text = moviewDetailsViewModel.movie?.imdbVotes
        contentView.movieLanguage.text = moviewDetailsViewModel.movie?.Language
        contentView.movieReleased.text = moviewDetailsViewModel.movie?.Released
        contentView.movieDirector.text = moviewDetailsViewModel.movie?.Director
        contentView.movieWriter.text = moviewDetailsViewModel.movie?.Writer
        contentView.movieActors.text = moviewDetailsViewModel.movie?.Actors
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = moviewDetailsViewModel.movie?.Title
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
