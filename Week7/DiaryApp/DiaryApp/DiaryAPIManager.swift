//
//  DiaryAPIManager.swift
//  DiaryApp
//
//  Created by Kim TaeSoo on 2022/08/19.
//

import Foundation
import Alamofire
import SwiftyJSON


class UnsplashAPIManager {
    
    func getSearchData(query: String, page: Int) {
        let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = "https://api.unsplash.com/search/photos?client_id=\(APIKey.Unsplash_Access_Key)&page=\(page)&query=\(text)"
        let header: HTTPHeaders = ["client_id" : "bjXCCtx-Ka2O2QJVBEbOrcCRNKKJ-i1pAn0vh8MoOIk"]
        AF.request(url, method: .get, headers: header).responseData { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
