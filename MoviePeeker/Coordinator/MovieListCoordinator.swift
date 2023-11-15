//
//  MovieListCoordinator.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import UIKit

protocol MovieListCoordinatorProtocol {
    func selectMovie(_ movie: MovieViewModel)
}


class MovieListCoordinator: Coordinator, MovieListCoordinatorProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let useCase = MovieUseCase(service: NetworkService())
        let viewModel = MovieListViewModel(movieUseCase: useCase, coordinator: self)
        let viewController = MovieListViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func selectMovie(_ movie: MovieViewModel) {
        let detailsCoordinator = MovieDetailsCoordinator(navigationController: navigationController, movieId: movie.id)
        detailsCoordinator.start()
    }
}
