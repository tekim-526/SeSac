//
//  TMDBPersonAPiManager.swift
//  SesacWeek9
//
//  Created by Kim TaeSoo on 2022/08/30.
//

import Foundation

class TMDBPersonAPIManager {
    
    static func requestPerson(query: String, completionHandler: @escaping (Person?, APIError?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/search/person?api_key=60c04c10fbfff3c19d2d8f9e0ce01d7f&language=en-US&query=\(query)&page=1&include_adult=false&region=ko-KR")!
        
        let scheme = "https"
        let host = "api.themoviedb.org"
        let path = "/3/search/person"
        
        let key = "60c04c10fbfff3c19d2d8f9e0ce01d7f"
        let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let language = "ko-KR"
        
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        component.queryItems = [
            URLQueryItem(name: "api_key", value: key),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "region", value: language),
            URLQueryItem(name: "language", value: language),
            URLQueryItem(name: "include_adult", value: "false")
        ]
        let request = URLRequest(url: component.url!)
       
        URLSession.request(endPoint: request, completionHandler: completionHandler)
    }
}
