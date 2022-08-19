//
//  LoginView.swift
//  8.19 Assignment
//
//  Created by Kim TaeSoo on 2022/08/19.
//

import UIKit
import SnapKit

class LoginView: BaseView {
    let titleLabel: UILabel = {
       let view = UILabel()
        view.text = "NETFLIX"
        view.font = .systemFont(ofSize: 30, weight: .heavy)
        view.textColor = .red
        return view
    }()
    let emailTextField: CustomTextField = {
        let view = CustomTextField()
        view.placeholder = "이메일 주소 또는 전화번호"
        return view
    }()
    let passwordTextField: CustomTextField = {
        let view = CustomTextField()
        view.placeholder = "비밀번호"
        view.isSecureTextEntry = true
        return view
    }()
    let nicknameTextField: CustomTextField = {
        let view = CustomTextField()
        view.placeholder = "닉네임"
        return view
    }()
    let locationTextField: CustomTextField = {
        let view = CustomTextField()
        view.placeholder = "지역"
        return view
    }()
    let codeTextField: CustomTextField = {
        let view = CustomTextField()
        view.placeholder = "추천인 코드"
        return view
    }()
    let signUpButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.setTitle("회원가입", for: .normal)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func configureUI() {
        [titleLabel, emailTextField, passwordTextField, nicknameTextField, locationTextField, codeTextField, signUpButton].forEach { someView in
            self.addSubview(someView)
        }
    }
    override func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(40)
            make.centerX.equalTo(self.snp.centerX)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(80)
            make.centerX.equalTo(self.snp.centerX)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(titleLabel.snp.height)
        }
        [passwordTextField, nicknameTextField, locationTextField, codeTextField, signUpButton].forEach { someTextField in
            someTextField.snp.makeConstraints { make in
                make.height.equalTo(titleLabel.snp.height)
                make.centerX.equalTo(self.snp.centerX)
                make.leading.equalTo(20)
                make.trailing.equalTo(-20)
            }
        }
        passwordTextField.snp.makeConstraints { $0.top.equalTo(emailTextField.snp.bottom).offset(20) }
        nicknameTextField.snp.makeConstraints { $0.top.equalTo(passwordTextField.snp.bottom).offset(20) }
        locationTextField.snp.makeConstraints { $0.top.equalTo(nicknameTextField.snp.bottom).offset(20) }
        codeTextField.snp.makeConstraints { $0.top.equalTo(locationTextField.snp.bottom).offset(20) }
        signUpButton.snp.makeConstraints { $0.top.equalTo(codeTextField.snp.bottom).offset(20) }
    }
    
    
}
