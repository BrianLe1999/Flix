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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        MovieService.shared.fetchMovies { movies in
            self.movies = movies
        }
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
    


}

