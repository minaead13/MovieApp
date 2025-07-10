//
//  MoviesListViewModel.swift
//  MoviesApp
//
//  Created by OSX on 09/07/2025.
//

import Foundation

class MoviesListViewModel {
    
    // MARK: - Dependencies
    private let fetchMoviesUseCase: FetchMoviesUseCase
    weak var coordinator: MoviesCoordinatorProtocol?
    
    // MARK: - Published Properties
    @Published private(set) var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Init
    init(fetchMoviesUseCase: FetchMoviesUseCase) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
    }
    
    // MARK: - Fetch Movies
    func fetchMovies() {
        isLoading = true
        
        fetchMoviesUseCase.execute { [weak self] result in
            guard let self = self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let movies):
                self.movies = movies
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func toggleFavorite(at index: Int) {
        let movie = movies[index]
        fetchMoviesUseCase.execute(movieID: movie.id)
        movies[index].isFavorite.toggle()
    }
}

