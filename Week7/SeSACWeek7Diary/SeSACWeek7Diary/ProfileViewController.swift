//
//  ProfileViewController.swift
//  SeSACWeek7Diary
//
//  Created by Kim TaeSoo on 2022/08/18.
//

import UIKit
import SnapKit
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
    
    var saveButtonActionHandler: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configure()
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
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
        
        saveButtonActionHandler?()
        //화면 dismiss
        dismiss(animated: true)
    }
   

}
