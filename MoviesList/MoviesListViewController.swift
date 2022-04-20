//
//  MoviesListViewController.swift
//  MovieBuff
//
//  Created by Prashant Singh on 19/4/22.
//

import UIKit

class MoviesListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var moviewListViewModel: MoviesListViewModel!
    var searchController = UISearchController()
    var debounce_timer: Timer?
    var currentPage = 1
    
    private var movieListCollectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviewListViewModel = MoviesListViewModelImplementation()
        setupNavController()
        configureSearch()
        setupCollectionView()
        
        bindViewModel()
    }
    
    func setupNavController() {
        view.backgroundColor = UIColor.white
        navigationItem.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = "Type movie name here to search"
    }
    
    private func configureSearch() {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type movie name here to search"
        search.searchBar.delegate = self
        navigationItem.searchController = search
        self.searchController = search
    }
    
    func setupCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.minimumLineSpacing = 1
        collectionViewLayout.minimumInteritemSpacing = 1
        collectionViewLayout.itemSize = CGSize(width: (view.frame.size.width/2) - 4,
                                               height: (view.frame.size.height/3) - 4)
        
        movieListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        
        guard let movieListCollectionView = movieListCollectionView else {
            return
        }
        
        movieListCollectionView.register(MoviewListCollectionViewCell.self, forCellWithReuseIdentifier: MoviewListCollectionViewCell.cellIdentifier)
        
        movieListCollectionView.dataSource = self
        movieListCollectionView.delegate = self
        movieListCollectionView.frame = view.bounds
        
        view.addSubview(movieListCollectionView)
    }
    
    private func bindViewModel() {
        moviewListViewModel.didFetchMoviesSucceed = { [weak self] in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                self.refreshUI()
            }
        }
        
        moviewListViewModel.didFetchMoviesFail = { [weak self] error in
            guard let self = self else {
                return
            }
        }
 
        moviewListViewModel.didFetchMovieDetailsSucceed = { [weak self] movie in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                guard let VC = MovieDetailsViewController() as? MovieDetailsViewController else {
                    fatalError("Could not instantiate ViewController of type \(MovieDetailsViewController.description())")
                }
                let VM = MovieDetailsViewModelImplementation(movie: movie)
                VC.moviewDetailsViewModel = VM
                self.navigationController?.pushViewController(VC, animated: true)
            }
        }

    }
    
    private func refreshUI() {
        movieListCollectionView!.reloadSections(IndexSet.init(integer: 0))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviewListViewModel.movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = movieListCollectionView?.dequeueReusableCell(withReuseIdentifier: MoviewListCollectionViewCell.cellIdentifier, for: indexPath) as? MoviewListCollectionViewCell else {
            fatalError("Fatal Error")
        }
        configure(cell, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moviewListViewModel.fetchMovieDetails(for: indexPath.row)
    }
    
    private func configure(_ cell: MoviewListCollectionViewCell, for indexPath: IndexPath) {
        let movie = moviewListViewModel.getMovie(at: indexPath.row)
        cell.moviePoster.loadFrom(URLAddress: movie.Poster ?? "")
        cell.movieName.text = movie.Title
    }

}

extension MoviesListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        self.currentPage = 1
        guard let text = searchController.searchBar.text, !text.isEmpty else { return }
        debounce_timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
            self.moviewListViewModel.fetchMovies(for: text, pageNumber: self.currentPage)
        }
    }
    
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
