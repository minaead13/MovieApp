//
//  MovieDetailsViewController.swift
//  MoviesApp
//
//  Created by OSX on 09/07/2025.
//

import UIKit
import Kingfisher
import Combine

class MovieDetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    // MARK: - Properties
    private var cancellables = Set<AnyCancellable>()
    var viewModel: MovieDetailsViewModel!
    var spinnerView: UIView?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchMovieDetails()
        setupBindings()
    }
    
    private func setupBindings() {
        
        viewModel.$movie
            .receive(on: DispatchQueue.main)
            .sink { [weak self] movie in
                self?.configureUI(with: movie)
            }
            .store(in: &cancellables)
        
        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .sink { isLoading in
                isLoading ? self.showLoadingIndicator() : self.hideLoadingIndicator()
            }
            .store(in: &cancellables)
        
        viewModel.$errorMessage
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { error in
                self.errorLabel.text = error
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Configure UI
    private func configureUI(with movie: Movie) {
        if let posterURL = URL(string: "\(Endpoints.posterURL)\(movie.posterPath)") {
            posterImageView.kf.setImage(with: posterURL)
        }
        titleLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        overviewLabel.text = movie.overview
    }
    
}

// MARK: - Loading Indicator
extension MovieDetailsViewController {
    
    private func showLoadingIndicator() {
        spinnerView = displaySpinner(onView: view)
    }
    
    private func hideLoadingIndicator() {
        if let spinner = spinnerView {
            removeSpinner(spinner: spinner)
        }
    }
}
