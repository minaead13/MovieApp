//
//  HomeMoviesUseCase.swift
//  MoviesApp
//
//  Created by OSX on 09/07/2025.
//

import Foundation

protocol FetchMoviesUseCase {
    func execute(completion: @escaping (Result<[Movie], NetworkError>) -> Void)
    func execute(movieID: Int)
    func isFavorite(movieID: Int) -> Bool
}

class FetchMoviesUseCaseImpl: FetchMoviesUseCase {
   
    private let repository: MoviesRepository
    
    init(repository: MoviesRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<[Movie], NetworkError>) -> Void) {
        
        repository.fetchMovies { (result: Result<[MovieDTO], NetworkError>) in
            switch result {
            case .success(let moviesResponse):
                let movies = moviesResponse.map { dto in
                    var movie = dto.toDomain()
                    movie.isFavorite = self.isFavorite(movieID: dto.id)
                    return movie
                }
                completion(.success(movies))
            case .failure(let networkError):
                completion(.failure(networkError))
            }
        }
        
    }
    
    func execute(movieID: Int) {
        repository.toggleFavorite(movieID: movieID)
    }
    
    func isFavorite(movieID: Int) -> Bool {
        return repository.isFavorite(movieID: movieID)
    }
}
