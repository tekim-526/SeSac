//
//  RoundedImage.swift
//  8.19 Assignment
//
//  Created by Kim TaeSoo on 2022/08/19.
//

import UIKit

class RoundedImageView: UIImageView {
    
    override init(image: UIImage?) {
        super.init(image: image)
        configureImageViewUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImageViewUI() {
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 50
    }
}
