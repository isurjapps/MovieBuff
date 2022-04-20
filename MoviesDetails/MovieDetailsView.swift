//
//  MovieDetailsView.swift
//  MovieBuff
//
//  Created by Prashant Singh on 20/4/22.
//

import UIKit

final class MovieDetailsView: UIView {
        
        lazy var moviePoster = UIImageView()
        lazy var movieTitle = UILabel()
        lazy var movieYear = UILabel()
        lazy var movieCategory = UILabel()
        lazy var movieRunTime = UILabel()
        lazy var movieRating = UILabel()
        lazy var movieSynopsis = UILabel()
        lazy var movieScore = UILabel()
        lazy var movieLanguage = UILabel()
        lazy var movieReleased = UILabel()
        lazy var movieDirector = UILabel()
        lazy var movieWriter = UILabel()
        lazy var movieActors = UILabel()
    
        init() {
            super.init(frame: .zero)
    
            addSubviews()
            setUpConstraints()
            setUpViews()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        
        private func addSubviews() {
            [moviePoster, movieTitle, movieYear, movieCategory, movieRunTime, movieRating, movieSynopsis, movieScore, movieLanguage, movieReleased, movieDirector, movieWriter, movieActors]
                .forEach {
                    addSubview($0)
                    $0.translatesAutoresizingMaskIntoConstraints = false
                }
        }
        
        private func setUpConstraints() {
            
            let screenSize = UIScreen.main.bounds
            let screenWidth = screenSize.width
     
            NSLayoutConstraint.activate([
                moviePoster.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                moviePoster.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                moviePoster.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
                moviePoster.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
                moviePoster.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45),
                
                movieTitle.topAnchor.constraint(equalTo: moviePoster.bottomAnchor, constant: 5),
                movieTitle.centerXAnchor.constraint(equalTo: moviePoster.centerXAnchor),
                movieTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
                movieTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
                movieTitle.heightAnchor.constraint(equalToConstant: 20.0),
                
                movieYear.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 5),
                movieYear.centerXAnchor.constraint(equalTo: movieTitle.centerXAnchor),
                movieYear.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
                movieYear.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
                movieYear.heightAnchor.constraint(equalToConstant: 20.0),
                
                movieCategory.topAnchor.constraint(equalTo: movieYear.bottomAnchor, constant: 5),
                movieCategory.centerXAnchor.constraint(equalTo: movieYear.centerXAnchor),
                movieCategory.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
                movieCategory.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -screenWidth/1.5),
                movieCategory.heightAnchor.constraint(equalToConstant: 20.0),
                
                movieRunTime.topAnchor.constraint(equalTo: movieCategory.topAnchor),
                movieRunTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: screenWidth/1.75),
                movieRunTime.widthAnchor.constraint(equalToConstant: 50.0),
                movieRunTime.heightAnchor.constraint(equalToConstant: 20.0),
                
                movieRating.topAnchor.constraint(equalTo: movieCategory.topAnchor),
                movieRating.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: screenWidth/1.2),
                movieRating.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
                movieRating.widthAnchor.constraint(equalToConstant: 30.0),
                movieRating.heightAnchor.constraint(equalToConstant: 20.0),

                movieSynopsis.topAnchor.constraint(equalTo: movieRating.bottomAnchor, constant: 5),
                movieSynopsis.centerXAnchor.constraint(equalTo: movieRating.centerXAnchor),
                movieSynopsis.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
                movieSynopsis.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
                movieSynopsis.heightAnchor.constraint(equalToConstant: 50.0),
                
                movieScore.topAnchor.constraint(equalTo: movieSynopsis.bottomAnchor, constant: 5),
                movieScore.centerXAnchor.constraint(equalTo: movieSynopsis.centerXAnchor),
                movieScore.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
                movieScore.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -screenWidth/1.4),
                movieScore.heightAnchor.constraint(equalToConstant: 30.0),
                
                movieLanguage.topAnchor.constraint(equalTo: movieScore.topAnchor),
                movieLanguage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: screenWidth/3.0),
                movieLanguage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -screenWidth/3.0),
                movieLanguage.heightAnchor.constraint(equalToConstant: 30.0),
                
                movieReleased.topAnchor.constraint(equalTo: movieScore.topAnchor),
                movieReleased.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: screenWidth/1.4),
                movieReleased.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
                movieReleased.heightAnchor.constraint(equalToConstant: 30.0),
                                
                movieDirector.topAnchor.constraint(equalTo: movieReleased.bottomAnchor, constant: 5),
                movieDirector.centerXAnchor.constraint(equalTo: movieReleased.centerXAnchor),
                movieDirector.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
                movieDirector.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
                movieDirector.heightAnchor.constraint(equalToConstant: 20.0),
                
                movieWriter.topAnchor.constraint(equalTo: movieDirector.bottomAnchor, constant: 5),
                movieWriter.centerXAnchor.constraint(equalTo: movieDirector.centerXAnchor),
                movieWriter.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
                movieWriter.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
                movieWriter.heightAnchor.constraint(equalToConstant: 20.0),
                
                movieActors.topAnchor.constraint(equalTo: movieWriter.bottomAnchor, constant: 5),
                movieActors.centerXAnchor.constraint(equalTo: movieWriter.centerXAnchor),
                movieActors.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0),
                movieActors.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
                movieActors.heightAnchor.constraint(equalToConstant: 20.0)
            ])
        }
  
        private func setUpViews() {
            backgroundColor = UIColor.white

            movieSynopsis.numberOfLines = 0
            movieActors.numberOfLines = 0
            movieSynopsis.lineBreakMode = .byWordWrapping
            movieCategory.adjustsFontSizeToFitWidth = true
            movieRunTime.adjustsFontSizeToFitWidth = true
            movieRating.adjustsFontSizeToFitWidth = true
            movieSynopsis.adjustsFontSizeToFitWidth = true
            movieSynopsis.font = movieSynopsis.font.withSize(12)
            movieScore.adjustsFontSizeToFitWidth = true
            movieActors.adjustsFontSizeToFitWidth = true
            movieReleased.adjustsFontSizeToFitWidth = true
            
            movieDirector.font = movieDirector.font.withSize(12)
            movieWriter.font = movieWriter.font.withSize(12)
            movieActors.font = movieActors.font.withSize(12)
        }
}

