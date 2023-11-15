//
//  MovieUseCase.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import UIKit

protocol MoviePosterCaseProtocol: AnyObject {
    func downloadPoster(from poster: String, imageSize: ImageSize) async throws -> UIImage?
}

protocol MovieLoadUseCaseProtocol: MoviePosterCaseProtocol {
    func loadMovies() async throws -> Movies
}

protocol MovieDetailUseCaseProtocol: MoviePosterCaseProtocol  {
    func loadMovieDetails(for id: Int) async throws -> MovieDetail
}


// MARK: - Movie Use Case
class MovieUseCase {
    
    private let service: NetworkClient!
    
    init(service: NetworkClient!) {
        self.service = service
    }
}

// MARK: - Load All Movies
extension MovieUseCase: MovieLoadUseCaseProtocol  {
    func loadMovies() async throws -> Movies {
        let response = try await service.load(from: MovieRequest.loadMovies.asURLRequest())
        return try JSONDecoder().decode(Movies.self, from: response.data)
    }
}

// MARK: - Load Single Movies
extension MovieUseCase: MovieDetailUseCaseProtocol {
    func loadMovieDetails(for id: Int) async throws -> MovieDetail {
        let response = try await service.load(from: MovieRequest.movieDetails(id).asURLRequest())
        return try JSONDecoder().decode(MovieDetail.self, from: response.data)
    }
}

// MARK: - Download Poster
extension MovieUseCase {
    func downloadPoster(from poster: String, imageSize: ImageSize) async throws -> UIImage? {
        let response = try await service.load(from: MovieRequest.downloadPoster(poster, imageSize).asURLRequest())
        return UIImage(data: response.data)
    }
}
