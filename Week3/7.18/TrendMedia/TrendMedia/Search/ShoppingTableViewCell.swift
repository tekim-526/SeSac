//
//  ShoppingTableViewCell.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/19.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet weak var checkListLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    @IBOutlet weak var checkBoxImageView: UIImageView!
    
    
    @IBAction func starButtonTapped(_ sender: UIButton) {
        if sender.currentImage != UIImage(systemName: "star") {
            sender.setImage(UIImage(systemName: "star"), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }
    }
}
