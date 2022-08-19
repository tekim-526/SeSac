//
//  CustomTextField.swift
//  8.19 Assignment
//
//  Created by Kim TaeSoo on 2022/08/19.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextFieldUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTextFieldUI() {
        backgroundColor = .lightGray
        textColor = .white
        layer.cornerRadius = 5
        textAlignment = .center

    }
    
}
