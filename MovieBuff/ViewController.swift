//
//  ViewController.swift
//  MovieBuff
//
//  Created by Prashant Singh on 1/4/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var movieListService = NetworkManager()
        movieListService.downloadMovies { result in
            print("Data Result Is: \(result)")
        } failure: { error in
            print("Error Is: \(error)")
        }

    }


}

