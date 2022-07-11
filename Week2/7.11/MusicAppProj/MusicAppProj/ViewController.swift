//
//  ViewController.swift
//  MusicAppProj
//
//  Created by Kim TaeSoo on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {

  
    
    @IBOutlet var imageList: [UIImageView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        print("viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }

    func makeUI() {
        for image in imageList {
            image.layer.cornerRadius = 4.5
        }
    }

}

