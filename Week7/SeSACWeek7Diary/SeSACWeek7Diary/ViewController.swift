//
//  ViewController.swift
//  SeSACWeek7Diary
//
//  Created by Kim TaeSoo on 2022/08/16.
//

import UIKit
import UIFramework


class ViewController: UIViewController {

    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        showSesacAlert(title: "Title", message: "Message", buttonTitle: "Button Title") { _ in
//            self.view.backgroundColor = .systemMint
//        }
        testOpen()
//        sesacShowActivityViewController(shareImage: UIImage(systemName: "xmark")!, shareURL: "https://www.apple.com", shareText: "Shared Text")
        
        OpenWebView.presentWebViewController(self, url: "http://www.naver.com", transitionStyle: .present)
    }
    

}

