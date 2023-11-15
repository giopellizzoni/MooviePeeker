//
//  DetailsViewModel.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 15/11/23.
//

import UIKit

struct DetailsViewModel {
    let budget: Int
    let homepage: String
    let id: Int
    let overview: String
    let poster: UIImage?
    var releaseDate: String
    let revenue: Int
    let tagline: String
    let title: String
    let rating: Double
    
    
    static func build(movieDetails: MovieDetail, poster: UIImage?) -> Self {
        return DetailsViewModel(budget: movieDetails.budget,
                                homepage: movieDetails.homepage,
                                id: movieDetails.id,
                                overview: movieDetails.overview,
                                poster: poster, 
                                releaseDate: movieDetails.releaseDate,
                                revenue: movieDetails.revenue,
                                tagline: movieDetails.tagline,
                                title: movieDetails.title,
                                rating: movieDetails.rating)
        
    }
}
