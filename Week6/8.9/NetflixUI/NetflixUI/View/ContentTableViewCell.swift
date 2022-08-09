//
//  ContentTableViewCell.swift
//  NetflixUI
//
//  Created by Kim TaeSoo on 2022/08/09.
//

import UIKit

class ContentTableViewCell: UITableViewCell {

    @IBOutlet weak var contentCollectionView: UICollectionView!
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentCollectionView.collectionViewLayout = flowLayout()
        
    }

    func flowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 100, height: 130)
        
        return layout
    }

}
