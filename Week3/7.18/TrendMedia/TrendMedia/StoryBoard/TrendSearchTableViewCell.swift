//
//  TrendSearchTableViewCell.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/19.
//

import UIKit

class TrendSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    func configureCell(data: Movie) {
        titleLabel.text = data.title
        titleLabel.font = .boldSystemFont(ofSize: 15)
        dateLabel.text = "\(data.releaseDate) | \(data.runtime)분 | \(data.rate)점"
        descriptionLabel.text = data.overview
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.numberOfLines = 0
        
    }
}
