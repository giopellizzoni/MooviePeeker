//
//  MovieListViewModel.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import UIKit

protocol MovieListViewModelProtocol: AnyObject {
    var movies: [MovieViewModel] { get set }
    
    func loadMovies() async throws
}

class MovieListViewModel: MovieListViewModelProtocol {
    var movies: [MovieViewModel] = []
    
    private let movieUseCase: MovieUseCaseProtocol!
    
    init(movieUseCase: MovieUseCaseProtocol!) {
        self.movieUseCase = movieUseCase
    }
    
    func loadMovies() async throws {
        let moviesList = try await movieUseCase.loadMovies()
        self.movies.append(contentsOf: try await mapToMovies(from: moviesList))
    }
    
    private func mapToMovies(from movies: Movies) async throws -> [MovieViewModel] {
        return try await withThrowingTaskGroup(of: MovieViewModel.self) { group in
                for movie in movies.results {
                    group.addTask { [unowned self] in
                        try await getMovieViewModel(from: movie)
                    }
                }
                return try await group.reduce(into: [MovieViewModel]()) { $0.append($1) }
            }
    }
    
    private func getMovieViewModel(from movie: Movie) async throws -> MovieViewModel {
        let poster = try await self.movieUseCase.downloadPoster(from: movie.posterPath)
        return MovieViewModel.build(from: movie, poster: poster)
    }
    
}
