//
//  MovieUseCase.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import Foundation

protocol MovieUseCaseProtocol: AnyObject {
    func loadMovies() async throws -> Movies
    func loadMovieDetails(for id: Int) async throws -> Movie
}

class MovieUseCase: MovieUseCaseProtocol {
    
    private let service: HTTPClient!
    
    init(service: HTTPClient!) {
        self.service = service
    }
}

// MARK: - Load All Movies
extension MovieUseCase {
    func loadMovies() async throws -> Movies {
        let response = try await service.load(from: MovieRequest.loadMovies.asURLRequest())
        if let httpResponse = (response.response as? HTTPURLResponse), httpResponse.statusCode != 200 {
            print("Error")
        }
        return try JSONDecoder().decode(Movies.self, from: response.data)
    }
}

// MARK: - Load Single Movies
extension MovieUseCase {
    func loadMovieDetails(for id: Int) async throws -> Movie {
        let response = try await service.load(from: MovieRequest.movieDetails(id).asURLRequest())
        return try JSONDecoder().decode(Movie.self, from: response.data)
    }
}
