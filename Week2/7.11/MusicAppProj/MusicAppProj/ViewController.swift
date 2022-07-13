//
//  ViewController.swift
//  MusicAppProj
//
//  Created by Kim TaeSoo on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var shadowButton: UIButton!
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
        shadowButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowButton.layer.shadowColor = UIColor.white.cgColor
        shadowButton.layer.shadowOpacity = 1
        shadowButton.layer.shadowRadius = 1
    }

}

