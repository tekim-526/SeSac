//
//  ViewController.swift
//  SeSac Network Basic
//
//  Created by Kim TaeSoo on 2022/07/27.
//

import UIKit

class ViewController: UIViewController, ViewPresentableProtocol {
    var navTitleString: String = "대장님의 다마고치"
    
    var backgroundColor: UIColor = .blue
    
    func configureView() {
        navTitleString = "김태수님의 다마고치"
        backgroundColor = .red
        
        title = navTitleString
        view.backgroundColor = backgroundColor
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

