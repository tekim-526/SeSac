//
//  RecommandCollectionViewController.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/20.
//

import UIKit
import Toast
import Kingfisher

/*
 TableView > CollectionView
 Row > Item
 
 heightForRowAt > ??? -> FlowLayout (heightForItemAt이 없는 이유)
 
 */

class RecommandCollectionViewController: UICollectionViewController {
    // MARK: - KingFisher
    let imageURL = URL(string: "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20220607_214%2F165458453305506YX7_JPEG%2Fmovie_image.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 컬렉션뷰의 셀 크기, 셀사이 간격 등 설정 (Estimate Size: none으로 설정해야함!)
        let layout = UICollectionViewFlowLayout() // FlowLayout
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        // 레이아웃 넣어줌
        collectionView.collectionViewLayout = layout
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCollectionViewCell", for: indexPath) as? RecommandCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.posterImageView.backgroundColor = .systemMint
        // MARK: - KingFisher 사용
        cell.posterImageView.kf.setImage(with: imageURL)
        cell.posterImageView.contentMode = .scaleToFill
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // MARK: - Toast - Swift
        view.makeToast("\(indexPath.item + 1)번째 셀을 선택했습니다", duration: 1, position: .bottom)
        self.navigationController?.popViewController(animated: true)
    }
}
