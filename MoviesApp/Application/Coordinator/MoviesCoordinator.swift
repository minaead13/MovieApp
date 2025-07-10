//
//  MoviesCoordinator.swift
//  MoviesApp
//
//  Created by OSX on 09/07/2025.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

protocol MoviesCoordinatorProtocol: AnyObject {
    func showMovieDetails(movieID: Int)
}

class MoviesCoordinator: Coordinator, MoviesCoordinatorProtocol {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let useCase = AppDIContainer.shared.makeFetchMoviesUseCase()
        let viewModel = MoviesListViewModel(fetchMoviesUseCase: useCase)
        
        let moviesVC = MoviesListViewController()
        moviesVC.viewModel = viewModel
        moviesVC.viewModel.coordinator = self
        
        
        navigationController.pushViewController(moviesVC, animated: true)
    }
    
    func showMovieDetails(movieID: Int) {
        let useCase = AppDIContainer.shared.makeFetchMovieDetailsUseCase()
        let detailsViewModel = MovieDetailsViewModel(fetchMovieDetailsUseCase: useCase, movieID: movieID)
        
        let detailsVC = MovieDetailsViewController()
        detailsVC.viewModel = detailsViewModel
        
        navigationController.pushViewController(detailsVC, animated: true)
    }
}
