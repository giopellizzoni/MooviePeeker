//
//  MovieDetail.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 15/11/23.
//

import Foundation

struct MovieDetail: Codable {
    let budget: Int
    let homepage: String
    let id: Int
    let overview: String
    let poster: String
    var releaseDate: String
    let revenue: Int
    let tagline: String
    let title: String
    let rating: Double

    enum CodingKeys: String, CodingKey {
        case budget
        case homepage
        case id
        case overview
        case poster = "poster_path"
        case releaseDate = "release_date"
        case revenue
        case tagline
        case title
        case rating = "vote_average"
    }
}
