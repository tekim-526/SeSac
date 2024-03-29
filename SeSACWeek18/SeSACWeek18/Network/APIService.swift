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

enum SeSACError: Int, Error {
    case invalidAuthorization = 401
    case takenEmail = 406
    case emptyParameters = 501
}

extension SeSACError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidAuthorization:
            return "토큰이 만료되었습니다. 다시 로그인 해주세요."
        case .takenEmail:
            return "이미 가입된 이메일입니다."
        case .emptyParameters:
            return "파라미터가 비어있습니다."
        }
    }
}

class APIService {
    
    func requestSeSAC<T: Decodable>(type: T.Type = T.self, url: URL, method: HTTPMethod = .get, parameters: [String: String]? = nil, headers: HTTPHeaders, completion: @escaping (Result<T,Error>) -> Void) {
        
        AF.request(url, method: method, parameters: parameters, headers: headers)
            .validate(statusCode: 200...299)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value)) // 탈출클로저, 연관값, Result타입, 제네릭 ...
                case .failure(let error):
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let error = SeSACError(rawValue: statusCode) else { return }
                    completion(.failure(error))
                }
            }
    }
}
