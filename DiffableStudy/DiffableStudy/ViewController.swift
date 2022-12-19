//
//  ViewController.swift
//  DiffableStudy
//
//  Created by Kim TaeSoo on 2022/11/04.
//

import UIKit


struct User: Hashable {
    let id = UUID()
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var list = [
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123),
        User(name: "1234", age: 123)
    ]
    
    var dataSource: UICollectionViewDiffableDataSource<Int, User>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.collectionViewLayout = createLayout()
        configureDataSource()
    }

    func createLayout() -> UICollectionViewLayout {
        let config = UICollectionLayoutListConfiguration(appearance: .grouped)
        let layout =  UICollectionViewCompositionalLayout.list(using: config)
        return layout
    }
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, User> { cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.secondaryText = "\(itemIdentifier.age)"
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, User>()
        snapshot.appendSections([0])
        snapshot.appendItems(list)
        dataSource.apply(snapshot)
        
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("indexPath: \(indexPath)")
    }
}

