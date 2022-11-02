//
//  View.swift
//  LoginWithServer
//
//  Created by Kim TaeSoo on 2022/11/02.
//

import UIKit

import SnapKit

class View: UIView {
    
    let nameTF: UITextField = {
        return UITextField().customTF(placholder: "name")
    }()
    
    let emailTF: UITextField = {
        return UITextField().customTF(placholder: "email")
    }()
    
    let passwdTF: UITextField = {
        return UITextField().customTF(placholder: "password")
    }()
    
    let signupButton: UIButton = {
        return UIButton().customButton(title: "signup")
    }()
    
    let loginButton: UIButton = {
        return UIButton().customButton(title: "login")
    }()
    
    let profileButton: UIButton = {
        return UIButton().customButton(title: "profile")
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        [nameTF, emailTF, passwdTF, signupButton, loginButton, profileButton].forEach { self.addSubview($0) }
        self.backgroundColor = .white
    }
    
    func makeConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        let spacing = 20
        let height = 52
        
        nameTF.snp.makeConstraints { make in
            make.top.equalTo(safeArea).offset(spacing)
            make.leading.equalTo(safeArea).offset(spacing)
            make.trailing.equalTo(safeArea).inset(spacing)
            make.height.equalTo(height)
        }
        emailTF.snp.makeConstraints { make in
            make.top.equalTo(nameTF.snp.bottom).offset(spacing)
            make.leading.equalTo(safeArea).offset(spacing)
            make.trailing.equalTo(safeArea).inset(spacing)
            make.height.equalTo(height)
        }
        passwdTF.snp.makeConstraints { make in
            make.top.equalTo(emailTF.snp.bottom).offset(spacing)
            make.leading.equalTo(safeArea).offset(spacing)
            make.trailing.equalTo(safeArea).inset(spacing)
            make.height.equalTo(height)
        }
        signupButton.snp.makeConstraints { make in
            make.top.equalTo(passwdTF.snp.bottom).offset(spacing)
            make.leading.equalTo(safeArea).offset(spacing)
            make.trailing.equalTo(safeArea).inset(spacing)
            make.height.equalTo(height)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(signupButton.snp.bottom).offset(spacing)
            make.leading.equalTo(safeArea).offset(spacing)
            make.trailing.equalTo(safeArea).inset(spacing)
            make.height.equalTo(height)
        }
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(spacing)
            make.leading.equalTo(safeArea).offset(spacing)
            make.trailing.equalTo(safeArea).inset(spacing)
            make.height.equalTo(height)
        }
    }
}

extension UITextField {
    func customTF(placholder: String) -> UITextField {
        let tf = UITextField()
        tf.placeholder = placholder
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.lightGray.cgColor
        return tf
    }
}

extension UIButton {
    func customButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemMint
        return button
    }
}
