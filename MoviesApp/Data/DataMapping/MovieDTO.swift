//
//  MovieDTO.swift
//  MoviesApp
//
//  Created by OSX on 10/07/2025.
//

import Foundation

struct MovieDTO: Decodable {
    let id: Int
    let overview: String
    let title: String
    let posterPath: String
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case id, overview, title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}

extension MovieDTO {
    func toDomain() -> Movie {
        return Movie(
            id: id,
            overview: overview,
            title: title,
            posterPath: posterPath,
            releaseDate: releaseDate
        )
    }
}
