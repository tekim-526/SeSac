//
//  MigrationViewController.swift
//  Firebase Project
//
//  Created by Kim TaeSoo on 2022/10/13.
//

import UIKit
import RealmSwift

class MigrationViewController: UIViewController {
    let localRealm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.file url
        print("FileURL: \(localRealm.configuration.fileURL!)")
        
        // 2. Schema Version
        do {
            let version = try schemaVersionAtURL(localRealm.configuration.fileURL!)
            print("Schema Version: \(version)")
        } catch {
            print(error)
        }
        
        //3. test
//        for i in 1...100 {
//            let task = Todo(title: "TODO : \(i)", importance: Int.random(in: 1...5))
//            try! localRealm.write {
//                localRealm.add(task)
//            }
//        }
        //4. detailTodo
//        for i in 1...19 {
//            let task = DetailTodo(detailTitle: "고기 \(i * 10)g 사기", favorite: true)
//            try! localRealm.write {
//                localRealm.add(task)
//            }
//        }
        // 특정 Todo 테이블에 DetailTodo 추가
//        guard let task = localRealm.objects(Todo.self).filter("title = 'TODO : 7'").first else { return }
//        let detail = DetailTodo(detailTitle: "김태수", favorite: true)
//        try! localRealm.write {
//            task.detail.append(detail)
//        }
        
        //특정 Todo 테이블 삭제
//        guard let task = localRealm.objects(Todo.self).filter("title = 'TODO : 7'").first else { return }
//        try! localRealm.write {
//            localRealm.delete(task.detail)
//            localRealm.delete(task)
//        }
        
        guard let task = localRealm.objects(Todo.self).filter("title = 'TODO : 6'").first else { return }
        let memo = Memo()
        memo.content = "Contents"
        memo.date = Date()
        
        try! localRealm.write {
            task.memo = memo
        }
    }
    


}
