//
//  ShoppinListTableViewCell.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/22.
//

import UIKit
import SnapKit
import RealmSwift
class ShoppinListTableViewCell: UITableViewCell {
    let isFinishedButton: UIButton = {
        let view = UIButton()
//        let image = UIImage(systemName: "checkmark.square")
//        view.setImage(image, for: .normal)
       
        
        return view
    }()
    
    let label: UILabel = {
        let view = UILabel()
        return view
    }()
    
    let isFavoriteButton: UIButton = {
        let view = UIButton()
        let image = UIImage(systemName: "heart")
        view.setImage(image, for: .normal)
        view.tintColor = .systemPink
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ShoppinListTableViewCell")
        configureUI()
        makeConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureUI() {
        
        [isFinishedButton, label, isFavoriteButton].forEach { self.contentView.addSubview($0) }
    }
    
    func makeConstraints() {
        isFinishedButton.snp.makeConstraints { make in
            make.leading.equalTo(12)
            make.centerY.equalTo(self.snp.centerY)
            make.width.height.equalTo(24)
        }
        label.snp.makeConstraints { make in
            make.leading.equalTo(isFinishedButton.snp.trailing).offset(12)
            make.centerY.equalTo(self.snp.centerY)
        }
        isFavoriteButton.snp.makeConstraints { make in
            make.trailing.equalTo(-12)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
    
    
}
