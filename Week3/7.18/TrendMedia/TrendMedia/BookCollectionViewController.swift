//
//  BookCollectionViewController.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/20.
//

import UIKit
import Toast

class BookCollectionViewController: UICollectionViewController {
    let movie = MovieInfo()
    let color: [UIColor] = [.systemMint, .systemPink, .systemCyan, .systemOrange, .systemBrown, .systemPurple, .systemTeal]
    override func viewDidLoad() {
        super.viewDidLoad()

        makeCollectionViewUI()
        
    }
    func makeCollectionViewUI() {
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 8
        let width = UIScreen.main.bounds.width - (space * 3)
        
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.minimumInteritemSpacing = space
        layout.minimumLineSpacing = space
        
        collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.movie2.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        
        cell.configureCell(movie: movie.movie2[indexPath.row], color: color[indexPath.row % color.count])
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.makeToast("\(indexPath.row)번째 탭이 선택되었습니다.", duration: 1)
    }

}
