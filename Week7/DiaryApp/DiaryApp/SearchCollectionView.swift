//
//  SearchCollectionView.swift
//  DiaryApp
//
//  Created by Kim TaeSoo on 2022/08/19.
//

import UIKit
import SnapKit

class SearchCollectionView: BaseView {
    let searchBar: UISearchBar = {
        let view = UISearchBar()
        return view
    }()
    let resultcollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .red
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func configureUI() {
        [resultcollectionView, searchBar].forEach { self.addSubview($0) }
    }
    override func makeConstraints() {
        searchBar.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(0)
        }
        resultcollectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom)
            $0.leading.trailing.bottom.equalTo(0)
        }
    }
}
