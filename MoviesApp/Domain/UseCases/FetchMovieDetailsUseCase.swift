//
//  FetchMovieDetailsUseCase.swift
//  MoviesApp
//
//  Created by OSX on 09/07/2025.
//

import Foundation

protocol FetchMovieDetailsUseCase {
    func execute(movieID: Int, completion: @escaping (Result<Movie, NetworkError>) -> Void)
}

class FetchMovieDetailsUseCaseImpl: FetchMovieDetailsUseCase {
    
    private let repository: MovieDetailsRepository
    
    init(repository: MovieDetailsRepository) {
        self.repository = repository
    }
    
    func execute(movieID: Int, completion: @escaping (Result<Movie, NetworkError>) -> Void) {
        repository.fetchMovieDetails(movieID: movieID, completion: completion)
    }
}
