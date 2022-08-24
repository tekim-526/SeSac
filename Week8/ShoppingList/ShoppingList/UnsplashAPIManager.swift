//
//  UnsplashAPIManager.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/24.
//

import Foundation
import Alamofire
import SwiftyJSON

struct APIKey {
    static let Unsplash_Access_Key = "bjXCCtx-Ka2O2QJVBEbOrcCRNKKJ-i1pAn0vh8MoOIk"
}

class UnsplashAPIManager {
    
    static func getSearchData(query: String, page: Int, completionHandler: @escaping ([URL]) -> ()) {
        guard let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        var imageURLArray: [URL] = []
        let url = "https://api.unsplash.com/search/photos?client_id=\(APIKey.Unsplash_Access_Key)&page=\(page)&query=\(text)"
        let header: HTTPHeaders = ["client_id" : "bjXCCtx-Ka2O2QJVBEbOrcCRNKKJ-i1pAn0vh8MoOIk"]
        AF.request(url, method: .get, headers: header).responseData { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                for i in 0...9 {
                    if let url = URL(string: json["results"][i]["urls"]["regular"].stringValue) {
                        imageURLArray.append(url)
                    }
                }
                completionHandler(imageURLArray)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
