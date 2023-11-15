//
//  MovieDetailsViewModel.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 15/11/23.
//

import Foundation

protocol MovieDetailsViewModelProtocol: AnyObject {
    var movieId: Int { get set }
    func getMovieDetails() async throws -> DetailsViewModel
}

class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
 
    var movieId: Int
    var detailsViewModel: DetailsViewModel?
    
    private let useCase: MovieDetailUseCaseProtocol!
    
    init(useCase: MovieDetailUseCaseProtocol!, movieId: Int) {
        self.useCase = useCase
        self.movieId = movieId
    }
    
    func getMovieDetails() async throws -> DetailsViewModel {
        let movieDetails = try await useCase.loadMovieDetails(for: movieId)
        return try await mapMovieDetails(from: movieDetails)
    }
    
    private func mapMovieDetails(from movie: MovieDetail) async throws -> DetailsViewModel {
        let poster = try await useCase.downloadPoster(from: movie.poster)
        return DetailsViewModel.build(movieDetails: movie, poster: poster)
    }
    
}
