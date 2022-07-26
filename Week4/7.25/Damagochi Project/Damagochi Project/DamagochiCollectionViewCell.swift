//
//  DamagochiCollectionViewCell.swift
//  Damagochi Project
//
//  Created by Kim TaeSoo on 2022/07/22.
//

import UIKit

class DamagochiCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var damagochiImageView: UIImageView!
    @IBOutlet weak var damagochiNameLabel: UILabel!

    func makeUI(row: Int) {
        if row < Damagochi.allCases.count {
            damagochiImageView.image = Damagochi.allCases[row].imageAsset
        } else {
            damagochiImageView.image = UIImage(named: "noImage")
        }
        
        damagochiNameLabel.textAlignment = .center
        if row < Damagochi.allCases.count {
            damagochiNameLabel.text = "\(Damagochi.allCases[row].damagochiName)"
            damagochiNameLabel.sizeToFit()
        } else {
            damagochiNameLabel.text = "준비중이에요"
        }
        
        damagochiNameLabel.textColor = Model().textColor
        damagochiNameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        damagochiNameLabel.layer.borderWidth = 1
        damagochiNameLabel.layer.borderColor = UIColor.gray.cgColor
        damagochiNameLabel.layer.cornerRadius = 5
    }
}


