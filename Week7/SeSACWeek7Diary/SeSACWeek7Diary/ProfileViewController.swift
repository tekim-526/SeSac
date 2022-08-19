//
//  ProfileViewController.swift
//  SeSACWeek7Diary
//
//  Created by Kim TaeSoo on 2022/08/18.
//

import UIKit
import SnapKit

extension NSNotification.Name {
    static let saveButton = NSNotification.Name("saveButtonNotification")
}


class ProfileViewController: UIViewController {
    
    let saveButton: UIButton = {
        let view = UIButton()
        view.setTitle("저장", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    let nameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "닉네임을 입력하세요"
        view.backgroundColor = .brown
        view.textColor = .white
        return view
    }()
    
    var saveButtonActionHandler: ((String?) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name("test"), object: nil)
    }
    
    @objc func saveButtonNotificationObserver(notification: NSNotification) {
        if let name = notification.userInfo?["name"] as? String {
            print(nameTextField)
            self.nameTextField.text = name
        }
    }
    
    func configure() {
        [saveButton, nameTextField].forEach { someView in
            view.addSubview(someView)
        }
        saveButton.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.center.equalTo(view.center)
        }
        nameTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view).inset(50)
            make.top.equalTo(50)
            make.height.equalTo(50)
        }
    }
    @objc func saveButtonTapped() {
        // 1. 클로저를 통한 값 전달
        //saveButtonActionHandler?(nameTextField.text)
        
        // 2. 노티피케이션을 통한 값 전달
        NotificationCenter.default.post(name: Notification.Name.saveButton, object: nil, userInfo: ["name" : nameTextField.text, "value" : 123456])
        
        
        //화면 dismiss
        dismiss(animated: true)
    }
   
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("test"), object: nil)
    }
}
