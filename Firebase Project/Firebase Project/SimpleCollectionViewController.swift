//
//  SimpleCollectionViewController.swift
//  Firebase Project
//
//  Created by Kim TaeSoo on 2022/10/18.
//

import UIKit
import RealmSwift

class SimpleCollectionViewController: UICollectionViewController {
    var tasks: Results<Todo>!
    let localRealm = try! Realm()
    
    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, Todo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = localRealm.objects(Todo.self)
        let tv = UITableView()
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        collectionView.collectionViewLayout = layout
        cellRegistration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            var content = cell.defaultContentConfiguration()
            content.image = itemIdentifier.importance < 2 ? UIImage(systemName: "star") : UIImage(systemName: "star.fill")
            content.text = itemIdentifier.title
            content.secondaryText = "\(itemIdentifier.detail.count)개의 세부 항목"
            cell.contentConfiguration = content
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = tasks[indexPath.item]
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        
        var test: fruit = Apple()
        test = Banana()
        test = Melon()
        return cell
    }
 
}
class food {
    
}

protocol fruit {
    
}

class Apple: food, fruit {
    
}

class Banana: food, fruit {
    
}

enum Strawberry: fruit {
    
}

struct Melon: fruit {
    
}
