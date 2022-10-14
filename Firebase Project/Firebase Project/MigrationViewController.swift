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
        
        // 3. test
//        for i in 1...100 {
//            let task = Todo(title: "TODO : \(i)", favorite: Int.random(in: 1...50))
//            try! localRealm.write {
//                localRealm.add(task)
//            }
//        }
    }
    


}
