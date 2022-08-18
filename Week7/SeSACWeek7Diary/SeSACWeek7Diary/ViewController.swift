//
//  ViewController.swift
//  SeSACWeek7Diary
//
//  Created by Kim TaeSoo on 2022/08/16.
//

import UIKit
import UIFramework

import SnapKit

class ViewController: UIViewController {

    let nameButton: UIButton = {
        let view = UIButton()
        view.setTitle("닉네임", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        nameButton.addTarget(self, action: #selector(nameButtonTapped), for: .touchUpInside)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    @objc func nameButtonTapped() {
        let vc = ProfileViewController()
        vc.saveButtonActionHandler = {
            self.nameButton.setTitle(vc.nameTextField.text, for: .normal)
        }

        present(vc, animated: true)
    }
    
    func configure() {
        view.addSubview(nameButton)
        nameButton.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.center.equalTo(view.center)
        }
    }
}

