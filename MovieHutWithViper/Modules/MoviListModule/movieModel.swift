//
//  movieModel.swift
//  MovieHutWithViper
//
//  Created by Faizul Karim on 20/3/22.
//

import Foundation
import ObjectMapper
//struct movieModel: Codable {
//    let totalPages, page: Int
//    let results: [Result]
//    let totalResults: Int
//}
//
//// MARK: - Result
//struct Result: Codable {
//    let releaseDate, overview: String
//    let video: Bool
//    let originalTitle: String
//    let popularity: Double
//    let id: Int
//    let backdropPath: String
//    let adult: Bool
//    let posterPath: String
//    let voteAverage: Double
//    let title: String
//    let voteCount: Int
//
//}


class movieModel : Mappable{
    var id: Int?
    var popularity: Double?
    var title, releaseDate, posterPath, overview: String?
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        popularity <- map["popularity"]
        releaseDate <- map["release_date"]
        posterPath <- map["posterPath"]
        overview <- map["overView"]
    }
    
    
}


