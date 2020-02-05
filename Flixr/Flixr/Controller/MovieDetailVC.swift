//
//  MovieDetailVC.swift
//  Flixr
//
//  Created by Joshua Madrigal on 2/5/20.
//  Copyright © 2020 Joshua Madrigal. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailVC: UIViewController {
    
    var movie: [String: Any]!
    
    
    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        detailsLabel.text = movie["overview"] as? String
        detailsLabel.sizeToFit()
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let postURL = movie["poster_path"] as! String
        let combinedURL = URL(string: baseURL + postURL)
              
        moviePoster.af_setImage(withURL: combinedURL!)
        
        let backDropURL = movie["backdrop_path"] as! String
        let backDropCombo = URL(string: "https://image.tmdb.org/t/p/w780" + postURL)
        
        backdropImage.af_setImage(withURL: backDropCombo!)
        
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
