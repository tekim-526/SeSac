//
//  BookCollectionViewCell.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/20.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewInCollectionView: UIView!
    @IBOutlet weak var rateLabel: UILabel!

    func configureCell(movie: Movie2, color: UIColor) {
        titleLabel.text = movie.title
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 18)
        
        rateLabel.text = "🌟 \(movie.rate)"
        rateLabel.textColor = .white
        rateLabel.font = .systemFont(ofSize: 13)
        
        poster.image = movie.poster
        poster.layer.cornerRadius = 15
        
        viewInCollectionView.backgroundColor = color
        viewInCollectionView.layer.cornerRadius = 15
    }
}
