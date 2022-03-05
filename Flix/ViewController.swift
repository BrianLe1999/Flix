//
//  ViewController.swift
//  Flix
//
//  Created by 01659826174 01659826174 on 2/19/22.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private var movies = [Movie]() {
        didSet {
            movieTableView.reloadData()
        }
    }
   

    @IBOutlet weak var movieTableView: UITableView!
    private let sequeIdentifier = "detailSeque"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieTableView.dataSource = self
        movieTableView.delegate = self
        let allMoviesURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        MovieService.shared.fetchMovies(urlString: allMoviesURL, completion: { movies in
            self.movies = movies
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableViewCell") as! movieTableViewCell
        
        let movie = self.movies[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == sequeIdentifier {
            let detailMovieViewController = segue.destination as? MovieDetailViewController
            let selectedRow = movieTableView.indexPathForSelectedRow
            let movie = movies[selectedRow!.row]
            detailMovieViewController?.movie = movie
            
        }
    }
    


}

