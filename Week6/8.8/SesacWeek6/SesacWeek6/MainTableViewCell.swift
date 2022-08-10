//
//  MainTableViewCell.swift
//  SesacWeek6
//
//  Created by Kim TaeSoo on 2022/08/09.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        print("MainTableViewCell", #function)
    }

    func setupUI() {
        
        titleLabel.text = "넷플릭스 인기 컨텐츠"
        titleLabel.font = . boldSystemFont(ofSize: 24)
        titleLabel.backgroundColor = .clear
        
        contentCollectionView.backgroundColor = .clear
        contentCollectionView.collectionViewLayout = collectionViewLayout()
    }
    func collectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 8)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        
        return layout
    }
}
