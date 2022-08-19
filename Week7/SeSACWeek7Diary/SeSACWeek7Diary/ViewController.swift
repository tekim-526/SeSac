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
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: Notification.Name("saveButtonNotification"), object: nil)
        
    
    }
    
    @objc func saveButtonNotificationObserver(notification: NSNotification) {
        if let name = notification.userInfo?["name"] as? String {
            print(name)
            self.nameButton.setTitle(name, for: .normal)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let vc = WriteViewController()
//        present(vc, animated: true)
    }
    
    @objc func nameButtonTapped() {
        let vc = ProfileViewController()
        vc.saveButtonActionHandler = { name in
            self.nameButton.setTitle(name, for: .normal)
        }
        present(vc, animated: true)
        NotificationCenter.default.post(name: Notification.Name("test"), object: nil, userInfo: ["name" : "\(Int.random(in: 1...100000))", "value" : 123456])
    }
    
    func configure() {
        view.addSubview(nameButton)
        nameButton.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.center.equalTo(view.center)
        }
    }
}

