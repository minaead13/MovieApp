//
//  MovieDetailsRepositoryImpl.swift
//  MoviesApp
//
//  Created by OSX on 09/07/2025.
//

import Foundation

class MovieDetailsRepositoryImpl: MovieDetailsRepository {
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    func fetchMovieDetails(movieID: Int, completion: @escaping (Result<Movie, NetworkError>) -> Void) {
        
        guard let request = Endpoints.getMovieDetailsRequest(movieID: movieID) else {
            completion(.failure(.invalidURL))
            return
        }
        
        apiClient.request(request) { (result: Result<MovieDTO, NetworkError>) in
            switch result {
            case .success(let movieDTO):
                let movie = movieDTO.toDomain()
                completion(.success(movie))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
