//
//  TODO.swift
//  Firebase Project
//
//  Created by Kim TaeSoo on 2022/10/13.
//

import Foundation
import RealmSwift

class Todo: Object {
    @Persisted var title: String
    //@Persisted var content: String
    @Persisted var favorite: Double
    @Persisted var userDescription: String
    @Persisted var count: Int
    @Persisted var taesu: String
    @Persisted (primaryKey: true) var objectID: ObjectId
    
    convenience init(title: String, favorite: Int) {
        self.init()
        self.title = title
        self.favorite = Double(favorite)
    }
}
