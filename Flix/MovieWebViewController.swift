//
//  MovieWebViewController.swift
//  Flix
//
//  Created by 01659826174 01659826174 on 3/4/22.
//

import UIKit
import WebKit
class MovieWebViewController: UIViewController {

    @IBOutlet weak var movieWebView: WKWebView!
    var movieId: Int!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        MovieService.shared.fetchMovieVideos(movieId: movieId, completion: {key in
            let videoURL = URL(string: "https://www.youtube.com/watch?v=\(key)")
            let videoRequest = URLRequest(url: videoURL!)
            self.movieWebView.load(videoRequest)
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
