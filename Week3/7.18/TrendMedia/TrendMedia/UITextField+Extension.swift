//
//  UITextField+Extension.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/19.
//

import UIKit

extension UITextField {
    func borderColor() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1.0
        self.borderStyle = .none
        self.layer.cornerRadius = 10
    }
}

