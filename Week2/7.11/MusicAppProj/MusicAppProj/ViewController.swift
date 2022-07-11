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
        print("viewDidLoad")
        makeUI()
    }
    func makeUI() {
        for image in imageList {
            image.layer.cornerRadius = 4.5
        }
    }

}

