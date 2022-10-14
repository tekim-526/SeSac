//
//  LottoAPIManager.swift
//  SesacWeek9
//
//  Created by Kim TaeSoo on 2022/08/30.
//

import Foundation

// shared - 단순함. 커스텀 X. 응답 클로저. 백그라운드 X

// init(configuragtion:) - .default - shared 설정 유사. 커스텀O(ex. 셀룰러 연결 여부, 타임아웃 간격). 응답: 클로저 + 델리게이트
// init(configuragtion:) - .ephemeral(보안 기능), .background(ex. 넷플릭스 다운받기)

enum APIError: Error {
    case invalidResponse
    case noData
    case failedRequest
    case invalidData
}

class LottoAPIManager {
    
    
    static func requestLotto(drwno: Int, completionHandler: @escaping (Lotto?, APIError?) -> Void) {
        let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drwno)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                guard error == nil else {
                    completionHandler(nil, .failedRequest)
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
                    let result = try JSONDecoder().decode(Lotto.self, from: data)
                    
                    completionHandler(result, .none)
                } catch {
                    completionHandler(nil, .invalidData)
                }
            }
        }.resume()
    }
    
    
}

