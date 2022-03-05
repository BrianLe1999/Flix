//
//  MovieDetailViewController.swift
//  Flix
//
//  Created by 01659826174 01659826174 on 2/26/22.
//

import UIKit
import AlamofireImage

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    

    private var sequeIdentifier = "presentVideo"
    @IBAction func tapPosterAction(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: sequeIdentifier, sender: nil)
    }
    
    var movie: Movie!
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        let tapGestureRecognizer = UIGestureRecognizer(target: self, action: #selector(tapPosterAction(_:)))
        posterImageView.isUserInteractionEnabled = true
        posterImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func configure() {
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let defaultPosterURL = "/original/wwemzKWzjKYJFfCeiB57q3r4Bcm.svg"
        let defaultTitle = "No Title Found"
        let defaultDescription = "No Description Found"
        let defaultDate = "No Date Found"
        let posterURL = URL(string: baseURL + (movie.posterURL ?? defaultPosterURL))
        let backdropBaseURL = "https://image.tmdb.org/t/p/w780"
        let backdropURL = URL(string: backdropBaseURL + (movie.backdropURL ?? defaultPosterURL))
        
        posterImageView.af.setImage(withURL: posterURL!)
        backdropImageView.af.setImage(withURL: backdropURL!)
        titleLabel.text = movie.title ?? defaultTitle
        descriptionLabel.text = movie.description ?? defaultDescription
        releaseDateLabel.text = movie.releaseDate ?? defaultDate
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == sequeIdentifier {
            let movieWebViewController = segue.destination as? MovieWebViewController
            movieWebViewController?.movieId = movie.id
        }
    }

}
