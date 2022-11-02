//
//  ViewController.swift
//  SeSACWeek18
//
//  Created by Kim TaeSoo on 2022/11/02.
//

import UIKit

class ViewController: UIViewController {
    let api = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.login()
        api.profile()
    }


}

