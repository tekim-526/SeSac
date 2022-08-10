//
//  MovieModel.swift
//  NetflixUI
//
//  Created by Kim TaeSoo on 2022/08/09.
//

import Foundation

struct MovieModel: Equatable {
    var movieID: [Int]?
    var imageURL: [URL?]
    var backDropPathURL: [URL?]?
    var title: [String]?
    var overView: [String]?
    var genre: [Int]?
}
    
