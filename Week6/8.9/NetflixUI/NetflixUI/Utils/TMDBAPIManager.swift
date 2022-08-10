//
//  TMDBAPIManager.swift
//  NetflixUI
//
//  Created by Kim TaeSoo on 2022/08/09.
//

import UIKit

import Alamofire
import SwiftyJSON

class TMDBAPIManager {
    private init() { }
    static let shared = TMDBAPIManager()
    
    
    func fetchMovieData(trending description: String, completionHandler: @escaping (MovieModel) -> ()) {
        let url = EndPoint.TMDB_URL + description + "/week?api_key=" + APIKey.TMDB_Key
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                let imageURLList = json["results"].arrayValue.map { json in
                    URL(string: EndPoint.posterW500_URL + json["poster_path"].stringValue)
                }
               
               completionHandler(MovieModel(imageURL: imageURLList))
            case .failure(let error):
                print(error)
            }
        }
    }
}
