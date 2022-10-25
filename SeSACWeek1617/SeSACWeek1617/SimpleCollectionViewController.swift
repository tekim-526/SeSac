//
//  SimpleCollectionViewController.swift
//  SeSACWeek1617
//
//  Created by Kim TaeSoo on 2022/10/18.
//

import UIKit

struct User: Hashable {
    let id = UUID().uuidString
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


class SimpleCollectionViewController: UICollectionViewController {

    var list = [
        User(name: "A", age: 13),
                User(name: "B", age: 2),
                User(name: "C", age: 33),
                User(name: "D", age: 4)
    ]
    
    // cellForItemAt 전에 생성되어야 한다. => register 코드와 유사한 역할
    var cellRegistraion: UICollectionView.CellRegistration<UICollectionViewListCell, User>!
    var datasource: UICollectionViewDiffableDataSource<Int, User>!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView.collectionViewLayout = createLayout()
        cellRegistraion = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            // UIListContentConfiguration -> CollectionViewCell의 ContentView를 다루는 구조체
            var content = UIListContentConfiguration.valueCell() // cell.defaultContentConfiguration()

            content.text = itemIdentifier.name
            content.textProperties.color = .systemMint

            content.secondaryText = "\(itemIdentifier.age)"
            content.secondaryTextProperties.color = .white
            content.prefersSideBySideTextAndSecondaryText = false
            content.textToSecondaryTextVerticalPadding = 20
            
            content.image = itemIdentifier.age < 8 ? UIImage(systemName: "person.fill") : UIImage(systemName: "star.fill")
            content.imageProperties.tintColor = .systemMint
            
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .magenta
            backgroundConfig.cornerRadius = 10
            backgroundConfig.strokeWidth = 2
            backgroundConfig.strokeColor = .cyan
            cell.backgroundConfiguration = backgroundConfig
        }
        datasource = UICollectionViewDiffableDataSource(collectionView: self.collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: self.cellRegistraion, for: indexPath, item: itemIdentifier)
            
            return cell
        }
        var snapshot = NSDiffableDataSourceSnapshot<Int, User>()
        snapshot.appendSections([0])
        snapshot.appendItems(list)
        datasource.apply(snapshot)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = list[indexPath.item]
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistraion, for: indexPath, item: item)

        return cell
    }

}
extension SimpleCollectionViewController {
    private func createLayout() -> UICollectionViewLayout {
        // iOS14+ 컬렉션뷰를 테이블뷰 스타일처럼 사용가능 (List Configuration)
        // configuration은 컬렉션뷰의 설정임 insetGrouped, backgroundColor, etc..
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .brown
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
}
