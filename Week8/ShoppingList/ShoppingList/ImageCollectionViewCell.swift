//
//  ImageCollectionViewCell.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    let resultImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureUI() { self.contentView.addSubview(resultImageView) }
    func makeConstraints() {
        resultImageView.snp.makeConstraints { $0.edges.equalTo(0) }
    }
}
