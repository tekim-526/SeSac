//
//  SearchCollectionView.swift
//  DiaryApp
//
//  Created by Kim TaeSoo on 2022/08/19.
//

import UIKit

class SearchCollectionViewController: BaseViewController {
    let searchCollectionView = SearchCollectionView()
    override func loadView() {
        self.view = searchCollectionView
    }
    override func viewDidLoad() {
    }
    override func configureUI() {
        searchCollectionView.resultcollectionView.delegate = self
        searchCollectionView.resultcollectionView.dataSource = self
    }
    override func makeConstraints() {
        
    }
}
extension SearchCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
