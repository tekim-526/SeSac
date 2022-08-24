//
//  BaseView.swift
//  Backup
//
//  Created by Kim TaeSoo on 2022/08/24.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {}
    func makeConstraints() {}
}
