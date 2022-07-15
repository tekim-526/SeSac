//
//  SecondViewController.swift
//  LoginApp
//
//  Created by Kim TaeSoo on 2022/07/15.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var changeBarButton: UIBarButtonItem!
    @IBOutlet weak var profileLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        makeUI()
    }
    func makeUI() {
        profileLabel.text = "Kimflix를 시청할 프로필을 선택하세요."
        changeBarButton.title = "변경"
        changeBarButton.tintColor = .white
        changeBarButton.tintColor = .white
    }
    
    @IBAction func chageBarButtonTapped(_ sender: UIBarButtonItem) {
        if sender.title == "완료" {
            sender.title = "변경"
            profileLabel.text = "Kimflix를 시청할 프로필을 선택하세요."
        } else if sender.title == "변경" {
            profileLabel.text = "프로필 관리"
            sender.title = "완료"
        }
    }
    


}
