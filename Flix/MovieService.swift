//
//  MovieService.swift
//  Flix
//
//  Created by 01659826174 01659826174 on 2/19/22.
//

import Foundation
class MovieService {
    static let shared = MovieService()
    
    func fetchMovies(completion: @escaping(([Movie]) ->Void)){
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                    // TODO: Get the array of movies
                 let movieRawData = dataDictionary["results"] as! [[String : Any]]
                    // TODO: Store the movies in a property to use elsewhere
                 
                    // TODO: Reload your table view data
                 var movies = [Movie]()
                 for rawData in movieRawData {
                     let movie = Movie(title: rawData["title"] as! String, description: rawData["overview"] as! String, imageURL: rawData["poster_path"] as! String)
                     movies.append(movie)
                 }
            completion(movies)
             }
        }
        task.resume()
    }
}
