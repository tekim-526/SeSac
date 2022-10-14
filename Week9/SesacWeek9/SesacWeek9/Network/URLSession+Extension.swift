//
//  URLSession+Extension.swift
//  SesacWeek9
//
//  Created by Kim TaeSoo on 2022/08/30.
//

import Foundation

extension URLSession {
    
    typealias completionHandler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    func customDataTask(_ endPoint: URLRequest, completionHandler: @escaping completionHandler) -> URLSessionDataTask {
        let task = dataTask(with: endPoint, completionHandler: completionHandler)
        task.resume()
        return task
    }
    
    
    static func request<T: Codable>(_ session: URLSession = .shared, endPoint: URLRequest, completionHandler: @escaping (T?, APIError?) -> Void) {
        session.customDataTask(endPoint) { data, response, error in
            DispatchQueue.global().async {
                guard error == nil else {
                    completionHandler(nil, .invalidData)
                    return
                }
                guard let data = data else {
                    completionHandler(nil, .noData)
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    completionHandler(nil, .invalidResponse)
                    return
                }
                guard response.statusCode == 200 else {
                    completionHandler(nil, .failedRequest)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(result, .none)
                } catch {
                    completionHandler(nil, .invalidData)
                }
            }
        }
            
            
    }
    
}
