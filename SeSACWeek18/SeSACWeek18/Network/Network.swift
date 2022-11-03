//
//  Network.swift
//  SeSACWeek18
//
//  Created by Kim TaeSoo on 2022/11/03.
//

import Foundation
import Alamofire


final class Network {
    
    static let shared = Network()
    
    private init() {}
    
    func requestSeSAC<T: Decodable>(type: T.Type = T.self, url: URL, method: HTTPMethod = .get, parameters: [String: String]? = nil, headers: HTTPHeaders, completion: @escaping (Result<T,Error>) -> Void) {
        
        AF.request(url, method: method, parameters: parameters, headers: headers)
            .validate(statusCode: 200...299)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value)) // 탈출클로저, 연관값, Result타입, 제네릭 ...
                case .failure(_):
                    guard let statusCode = response.response?.statusCode else { return }
                    guard let error = SeSACError(rawValue: statusCode) else { return }
                    completion(.failure(error))
                }
            }
    }
}
