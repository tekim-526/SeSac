//
//  ClovaAPIManager.swift
//  SesacWeek6
//
//  Created by Kim TaeSoo on 2022/08/15.
//

import UIKit

import Alamofire
import SwiftyJSON

// 이미지 뷰 이미지 > 네이버 > 얼굴 분석 요청 > 응답
// 문자열이 아닌 파일, 이미지, pdf 파일 자체가 그대로 전송 되지 않음. => 텍스트 형태로 인코딩
// 어떤 파일의 종류가 서버에게 전달이 되는 지 명시 = Content-Type
struct ClovaAPIManager {
    static func getCelebrityInfo(sourceImage: UIImageView, completionHandler: @escaping (String) -> ()) {
        let url = URL.ClovaURL
        let header: HTTPHeaders = [
            "X-Naver-Client-Id" : APIKey.Naver_Client_Id,
            "X-Naver-Client-Secret" : APIKey.Naver_Client_Secret,
            "Content-Type" : "multipart/form-data"
        ]
        
        // UIImage를 텍스트 형태(바이너리 타입)로 변환해야 함
        guard let imageData = sourceImage.image?.jpegData(compressionQuality: 0.25) else { return }
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image")
        }, to: url, headers: header)
        .validate(statusCode: 200...500).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                completionHandler(json["faces"][0]["celebrity"]["value"].stringValue)
            case .failure(let error):
                print(error)
            }
        }
    }
}
