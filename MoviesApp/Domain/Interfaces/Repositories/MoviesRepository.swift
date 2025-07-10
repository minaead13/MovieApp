//
//  MoviesRepository.swift
//  MoviesApp
//
//  Created by OSX on 09/07/2025.
//

import Foundation

protocol MoviesRepository {
    func fetchMovies(completion: @escaping (Result<[MovieDTO], NetworkError>) -> Void)
    func isFavorite(movieID: Int) -> Bool
    func toggleFavorite(movieID: Int)
}
