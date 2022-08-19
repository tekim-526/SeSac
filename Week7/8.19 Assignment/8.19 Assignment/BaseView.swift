//
//  BaseView.swift
//  8.19 Assignment
//
//  Created by Kim TaeSoo on 2022/08/19.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        configureUI()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {}
    func makeConstraints() {}
}
