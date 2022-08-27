//
//  UserDirectory.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/27.
//

import Foundation
import RealmSwift

class UserDirectory {
    let localRealm = try! Realm()
    
    func fetch() -> Results<ShoppingListTable> {
        return localRealm.objects(ShoppingListTable.self)
    }
    func fetchDate(date: Date) -> Results<ShoppingListTable> {
        
        return localRealm.objects(ShoppingListTable.self).filter("date >= %@ AND date < %@", date, Date(timeInterval: 86400, since: date))
    }
    func updateFavorite(item: ShoppingListTable) {
        do {
            try localRealm.write {
                item.isFavorite = !item.isFavorite
            }
        } catch {
            print("error")
        }
    }
    func updateFinished(item: ShoppingListTable) {
        do {
            try localRealm.write {
                item.isFinished = !item.isFinished
            }
        } catch {
            print("error")
        }
    }
    func addTask(task: ShoppingListTable) {
        do {
            try localRealm.write {
                localRealm.add(task)
            }
        } catch {
            print("error")
        }
    }
    func deleteTask(task: ShoppingListTable) {
        
        do {
            try localRealm.write {
                localRealm.delete(task)
            }
        } catch {
            print("error")
        }
    }
}
