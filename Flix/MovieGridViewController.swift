//
//  MovieGridViewController.swift
//  Flix
//
//  Created by 01659826174 01659826174 on 3/2/22.
//

import UIKit

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var movies = [Movie]() {
        didSet {
            movieCollectionView.reloadData()
        }
    }

    @IBOutlet weak var movieCollectionView: UICollectionView!
    private var sequeIdentifier = "gridToDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self

        
        let layout = movieCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        let width = (view.frame.size.width - layout.minimumInteritemSpacing) / 2
        layout.itemSize = CGSize(width: width, height: width / 2 * 3)
        // Do any additional setup after loading the view.
        let superHeroMoviesURL = "https://api.themoviedb.org/3/movie/634649/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        MovieService.shared.fetchMovies(urlString: superHeroMoviesURL, completion: { movies in
            self.movies = movies
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        let movie = self.movies[indexPath.item]
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let defaultPosterURL = "/original/wwemzKWzjKYJFfCeiB57q3r4Bcm.svg"
        let posterURL = URL(string: baseURL + (movie.posterURL ?? defaultPosterURL))
        
        cell.posterImageView.af.setImage(withURL: posterURL!)
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == sequeIdentifier {
            let detailMovieViewController = segue.destination as? MovieDetailViewController
            let selectedItem = movieCollectionView.indexPathsForSelectedItems
            let index = (selectedItem?.first?.row)!
            let movie = movies[index]
            detailMovieViewController?.movie = movie
            
        }
    }
    
    
    

}
