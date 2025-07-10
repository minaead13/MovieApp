//
//  MovieDetailsRepository.swift
//  MoviesApp
//
//  Created by OSX on 09/07/2025.
//

import Foundation

protocol MovieDetailsRepository {
    func fetchMovieDetails(movieID: Int, completion: @escaping (Result<Movie, NetworkError>) -> Void)
}
