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
        let vc = CodeSnapViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
//        showSesacAlert(title: "Title", message: "Message", buttonTitle: "Button Title") { _ in
//            self.view.backgroundColor = .systemMint
//        }
//        let image = UIImage(systemName: "xmark")!
//        let shareURL = "https://www.apple.com"
//        sesacShowActivityViewController(shareImage: image, shareURL: shareURL, shareText: "Shared")
        testOpen()
        
        OpenWebView.presentWebViewController(self, url: "http://www.naver.com", transitionStyle: .present)
    }
    

}

