//
//  ShoppingListTable.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/22.
//

import Foundation
import RealmSwift

class ShoppingListTable: Object {
    @Persisted var tableString: String?
    @Persisted var isFavorite: Bool
    @Persisted var isFinished: Bool
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    convenience init(tableString: String?) {
        self.init()
        self.tableString = tableString
        self.isFavorite = false
        self.isFinished = false
    }
}
