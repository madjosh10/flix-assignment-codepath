//
//  MovieCell.swift
//  Flixr
//
//  Created by Joshua Madrigal on 1/29/20.
//  Copyright © 2020 Joshua Madrigal. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieSynopsis: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
