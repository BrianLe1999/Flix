//
//  movieTableViewCell.swift
//  Flix
//
//  Created by 01659826174 01659826174 on 2/19/22.
//

import UIKit

class movieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func configure(with movie: Movie) {
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie.imageURL
        let posterURL = URL(string: baseURL + posterPath)
        
        movieImageView.af.setImage(withURL: posterURL!)
        titleLabel.text = movie.title
        descriptionLabel.text = movie.description
    }

}
