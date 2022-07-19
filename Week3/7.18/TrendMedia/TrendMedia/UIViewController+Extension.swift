//
//  UIViewController+Extension.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/19.
//

import UIKit

extension UIViewController {
    
    func setBackgroundColor() {
        view.backgroundColor = .orange
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "확인", message: "확인", preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
