//
//  BaseViewController.swift
//  SeSACWeek7Diary
//
//  Created by Kim TaeSoo on 2022/08/19.
//

import UIKit


class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configure()
    }
    
    func configure() {
        print("BaseViewController", #function)
    }
    
   
    
    func showAlertMessage(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "네", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
