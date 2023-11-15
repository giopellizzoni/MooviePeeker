//
//  MovieDetailsCoordinator.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 15/11/23.
//

import UIKit

protocol MovieDetailsCoordinatorProtocol: AnyObject {
    func navigateBack()
}

class MovieDetailsCoordinator: Coordinator, MovieDetailsCoordinatorProtocol {
    var navigationController: UINavigationController
    var movieId: Int
    
    init(navigationController: UINavigationController, movieId: Int) {
        self.navigationController = navigationController
        self.movieId = movieId
    }
    
    func start() {
        let useCase = MovieUseCase(service: NetworkService())
        let viewModel = MovieDetailsViewModel(useCase: useCase, movieId: movieId)
        let viewController = MovieDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateBack() {
        navigationController.popViewController(animated: true)
    }
    
    
}
