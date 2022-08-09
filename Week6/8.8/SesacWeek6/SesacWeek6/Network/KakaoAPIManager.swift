//
//  KakaoAPIManager.swift
//  SesacWeek6
//
//  Created by Kim TaeSoo on 2022/08/08.
//

import Foundation

import Alamofire
import SwiftyJSON


class KakaoAPIManager {
    static let shared = KakaoAPIManager()

    private init() {}
    
    let header: HTTPHeaders = ["Authorization": "KakaoAK \(APIKey.Kakao_API_Key)"]
    
    func callRequest(type: EndPoint,query: String, completionHandler: @escaping (JSON) -> ()) {
        guard let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        let url = type.requestURL + text
    
        AF.request(url, method: .get, headers: header).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                completionHandler(json)
            case .failure(let error):
                print(error)
            }
        }
    }
}
