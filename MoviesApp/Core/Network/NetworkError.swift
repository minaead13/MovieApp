//
//  NetworkError.swift
//  MoviesApp
//
//  Created by OSX on 09/07/2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodingError
    case serverError(String)
    case unknown
}
