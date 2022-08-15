//
//  URL+Extension.swift
//  SesacWeek6
//
//  Created by Kim TaeSoo on 2022/08/08.
//

import Foundation

extension URL {
    static let baseURL = "https://dapi.kakao.com/v2/search/"
    static let ClovaURL = "https://openapi.naver.com/v1/vision/celebrity"
    static func makeEndPointString(_ endpoint: String) -> String {
        return baseURL + endpoint
    }
}
