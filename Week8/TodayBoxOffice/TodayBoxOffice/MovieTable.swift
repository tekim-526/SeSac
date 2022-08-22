//
//  MovieTable.swift
//  TodayBoxOffice
//
//  Created by Kim TaeSoo on 2022/08/22.
//

import Foundation
import RealmSwift
import SwiftyJSON

class MovieTable: Object {
    @Persisted(primaryKey: true) var objectId: ObjectId
    @Persisted var showRange: String
    @Persisted var movieNm: String
    @Persisted var rank: String
    @Persisted var openDt: String
    
    convenience init(showRange: String, movieNm: String, rank: String, openDt: String) {
        self.init()
        self.showRange = showRange
        self.movieNm = movieNm
        self.rank = rank
        self.openDt = openDt
    }
}
