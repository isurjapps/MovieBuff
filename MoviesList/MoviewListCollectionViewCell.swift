//
//  MoviewListCollectionViewCell.swift
//  MovieBuff
//
//  Created by Prashant Singh on 19/4/22.
//

import UIKit

class MoviewListCollectionViewCell: UICollectionViewCell {
    
    static var cellIdentifier = "MoviewListCollectionViewCell"
    
    lazy var moviePoster = UIImageView()
    lazy var movieName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [moviePoster, movieName]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        moviePoster.frame = CGRect(x: 5,
                                   y: 0,
                                   width: contentView.frame.size.width - 10,
                                   height: contentView.frame.size.height - 55)
        
        movieName.frame = CGRect(x: 5,
                                 y: contentView.frame.size.height - 50,
                                 width: contentView.frame.size.width - 10,
                                 height: 25)
    }
}
