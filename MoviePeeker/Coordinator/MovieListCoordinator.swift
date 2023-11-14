//
//  MovieListCoordinator.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import UIKit

protocol MovieListCoordinatorProtocol {
    func selectMovie(_ movie: Movie)
}


class MovieListCoordinator: Coordinator, MovieListCoordinatorProtocol {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let useCase = MovieUseCase(service: NetworkService())
        let viewModel = MovieListViewModel(movieUseCase: useCase)
        let viewController = MovieListViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func selectMovie(_ movie: Movie) {
        
    }
}
