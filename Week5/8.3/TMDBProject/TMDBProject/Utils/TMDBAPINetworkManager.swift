//
//  TMDBAPINetworkManager.swift
//  TMDBProject
//
//  Created by Kim TaeSoo on 2022/08/05.
//

import UIKit

import Alamofire
import SwiftyJSON

class TMDBAPINetworkManager {
    private init() { }
    
    static let shared = TMDBAPINetworkManager()
    var list: [CastModel] = []
    
    func fetchMovie(completionHandler: @escaping (MovieModel) -> ()) {
        let url = EndPoint.TMDB_URL + APIKey.TMDB_Key
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                
                let imageURLList = json["results"].arrayValue.map { json in
                    URL(string: EndPoint.posterW500_URL + json["poster_path"].stringValue)
                }
                let backDropPathURLList = json["results"].arrayValue.map { json in
                    URL(string: EndPoint.posterW1066_URL + json["backdrop_path"].stringValue)
                }
                let title = json["results"].arrayValue.map { $0["title"].stringValue }
                let overView = json["results"].arrayValue.map { $0["overview"].stringValue }
                let genreID = json["results"].arrayValue.map { $0["genre_ids"][0].intValue}
                let movieID = json["results"].arrayValue.map { $0["id"].intValue }
                
                completionHandler(MovieModel(movieID: movieID, imageURL: imageURLList, backDropPathURL: backDropPathURLList, title: title, overView: overView, genre: genreID))
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchCast(movieID: Int, completionHandler: @escaping ([CastModel]) -> ()) {
        let url = "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=" + APIKey.TMDB_Key
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                for index in 0...9 {
                    guard let profileImageURL = URL(string: EndPoint.posterW500_URL + json["cast"][index]["profile_path"].stringValue) else { return }
                    let cast = json["cast"][index]["name"].stringValue
                    let charactar = json["cast"][index]["character"].stringValue
                    self.list.append(CastModel(cast: cast, charactar: charactar, profileImageURL: profileImageURL))
                }
                completionHandler(self.list)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
