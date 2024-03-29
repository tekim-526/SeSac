//
//  MovieModel.swift
//  TMDBProject
//
//  Created by Kim TaeSoo on 2022/08/04.
//

import UIKit

struct MovieModel {
    var movieID: [Int]
    var imageURL: [URL?]
    var backDropPathURL: [URL?]
    var title: [String]
    var overView: [String]
    var genre: [Int]
}

struct CastModel: Equatable {
    var cast: String
    var charactar: String
    var profileImageURL: URL
    
}

struct TrailerModel {
    var trailerLink: URL
}
