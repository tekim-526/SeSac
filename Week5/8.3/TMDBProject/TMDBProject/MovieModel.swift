//
//  MovieModel.swift
//  TMDBProject
//
//  Created by Kim TaeSoo on 2022/08/04.
//

import UIKit
import SwiftyJSON
import Alamofire

struct MovieModel {
    var imageURL: URL
    var backDropPathURL: URL
    var title: String
    var overView: String
    var genre: String
}

struct CastModel {
    var cast: String
    var charactar: String
    var profileImageURL: URL
    
}
//
//func fetchRequest() {
//    let url = EndPoint.TMDB_URL + APIKey.TMDB_Key
//    
//    AF.request(url, method: .get).validate(statusCode: 200...500).responseData { response in
//        self.hud.show(in: self.view, animated: true)
//        switch response.result {
//        case .success(let value):
//            let json = JSON(value)
//            // 배열 만들어서 리팩토링 다시 해보자
//            for item in json["results"].arrayValue {
//                guard let imageURL = URL(string: EndPoint.poster_URL + item["poster_path"].stringValue) else { return }
//                let title = item["title"].stringValue
//                let overView = item["overview"].stringValue
//                let genreID = item["genre_ids"][0].intValue
//                
//                // genreID -> String
//                let url = EndPoint.genres_URL + APIKey.TMDB_Key
//                AF.request(url, method: .get).validate().responseData { response in
//                    switch response.result {
//                    case .success(let data):
//                        let json = JSON(data)
//                        for i in json["genres"].arrayValue {
//                            if i["id"].intValue == genreID {
//                                self.movieData.append(MovieModel(imageURL: imageURL, title: title, overView: overView, genre: i["name"].stringValue))
//                            }
//                        }
//                        self.mainTableView.reloadData()
//                    case .failure(let error):
//                        print(error)
//                    }
//                }
//                
//            }
//            self.hud.dismiss(animated: true)
//        case .failure(let error):
//            print(error)
//            self.hud.dismiss()
//        }
//    }
//}
