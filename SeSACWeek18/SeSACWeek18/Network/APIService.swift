//
//  APIServicee.swift
//  SeSACWeek18
//
//  Created by Kim TaeSoo on 2022/11/02.
//

import Foundation

import Alamofire

struct Login: Codable {
    let token: String
}
struct Profile: Codable {
    let user: User
}

struct User: Codable {
    let photo: String
    let email: String
    let username: String
}
class APIService {
    func signup() {
        let api = SeSACAPI.signup(username: "taesu", email: "qwe@qwe.com", password: "12345678")
       
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers).responseString { response in
            switch response.result {
            case .success(let value):
                print(value)
                
            case .failure(let error):
                print(error)
            
            }
        }
    }
    
    func login() {
        let api = SeSACAPI.login(email: "qwe@qwe.com", password: "12345678")
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers)
            .validate(statusCode: 200...299)
            .responseDecodable(of: Login.self) { response in
            switch response.result {
            case .success(let value):
                print(value.token)
                UserDefaults.standard.set(value.token, forKey: "token")
            case .failure(_):
                print(response.response?.statusCode)
            }
        }
    }
    
    func profile() {
        let api = SeSACAPI.profile
        
        AF.request(api.url, method: .get, headers: api.headers)
            .validate(statusCode: 200...299)
            .responseDecodable(of: Profile.self) { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(_):
                print("fail")
            }
        }
        
    }
    
}
