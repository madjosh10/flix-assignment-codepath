//
//  MoviesVC.swift
//  Flixr
//
//  Created by Joshua Madrigal on 1/29/20.
//  Copyright © 2020 Joshua Madrigal. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var movieDictionary = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

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
                self.movieDictionary = dataDictionary["results"] as! [[String: Any]]
                self.tableView.reloadData()
            
                
           }
        }
        task.resume()
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        
        let movie = movieDictionary[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
         
        cell.movieTitle.text = title
        cell.movieSynopsis.text = synopsis
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let postURL = movie["poster_path"] as! String
        let combinedURL = URL(string: baseURL + postURL)
        
        cell.moviePoster.af_setImage(withURL: combinedURL!)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//    } // end didSelectRowAt
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // grab the cell, indexpath and declare a variable that is using the
        // movieDictionary array
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = movieDictionary[indexPath.row]
        
        let detailsVC = segue.destination as! MovieDetailVC
        
        detailsVC.movie = movie
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

} // end MoviesVC
