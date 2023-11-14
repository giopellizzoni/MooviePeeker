//
//  MovieListViewModel.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import Foundation

protocol MovieListViewModelProtocol: AnyObject {
    var movies: Movies? { get set }
    
    func loadMovies() async throws
}

class MovieListViewModel: MovieListViewModelProtocol {
    var movies: Movies?
    
    private let movieUseCase: MovieUseCaseProtocol!
    
    init(movieUseCase: MovieUseCaseProtocol!) {
        self.movieUseCase = movieUseCase
    }
    
    func loadMovies() async throws {
        self.movies = try await movieUseCase.loadMovies()
    }
    
}
