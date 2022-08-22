//
//  MovieAPIManager.swift
//  TodayBoxOffice
//
//  Created by Kim TaeSoo on 2022/08/22.
//

import Foundation
import Alamofire
import SwiftyJSON
import RealmSwift

struct APIKey {
    static let Movie_APIKey = "f5eef3421c602c6cb7ea224104795888"
}

class MovieAPIManager {
    
    func fetchDailyBoxOfficeCount(date: String, completionHandler: @escaping (Int) -> ()) {
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(APIKey.Movie_APIKey)&targetDt=\(date)"
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                
                let json = JSON(data)
                
                completionHandler(json["boxOfficeResult"]["dailyBoxOfficeList"].arrayValue.count)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func fetchBoxOffice(date: String, boxOfficeCount: Int, localRealm: Realm, completionHandler: @escaping (Results<MovieTable>?) -> ()) {
        
        var tasks: Results<MovieTable>?
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(APIKey.Movie_APIKey)&targetDt=\(date)"
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                var task: MovieTable
                let json = JSON(data)
                for index in 0...boxOfficeCount - 1 {
                    task = MovieTable(showRange: json["boxOfficeResult"]["showRange"].stringValue,
                                      movieNm: json["boxOfficeResult"]["dailyBoxOfficeList"][index]["movieNm"].stringValue,
                                      rank: json["boxOfficeResult"]["dailyBoxOfficeList"][index]["rank"].stringValue,
                                      openDt: json["boxOfficeResult"]["dailyBoxOfficeList"][index]["openDt"].stringValue)
                    try! localRealm.write {
                        localRealm.add(task)
                    }
                }
                tasks = localRealm.objects(MovieTable.self)
                
                completionHandler(tasks)
            case .failure(let error):
                print(error)
            }
        }
    }
}
