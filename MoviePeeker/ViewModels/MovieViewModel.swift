//
//  MovieViewModel.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import UIKit

struct MovieViewModel {
    let id: Int
    let overview: String
    let poster: UIImage?
    let releaseDate: String
    let title: String
    let rating: Double
    
    static func build(from movie: Movie, poster: UIImage?) -> MovieViewModel {
        return MovieViewModel(id: movie.id,
                              overview: movie.overview,
                              poster: poster,
                              releaseDate: movie.releaseDate,
                              title: movie.title,
                              rating: movie.rating)
    }
}
