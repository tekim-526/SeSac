//
//  ViewController.swift
//  CodeBaseUI
//
//  Created by Kim TaeSoo on 2022/08/17.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
    let xbutton: UIButton = {
        let view = UIButton()
        let image = UIImage(systemName: "xmark")
        view.setImage(image, for: .normal)
        view.tintColor = .lightGray
        return view
    }()
    
    let presentButton: UIButton = {
        let view = UIButton()
        let image = UIImage(systemName: "shippingbox")
        view.setImage(image, for: .normal)
        view.tintColor = .lightGray
        return view
    }()
    
    let settingButton: UIButton = {
        let view = UIButton()
        let image = UIImage(systemName: "gearshape")
        view.setImage(image, for: .normal)
        view.tintColor = .lightGray
        return view
    }()
    
    let profileImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.fill")
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 25
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.text = "김태수"
        view.textColor = .black
        view.font = .systemFont(ofSize: 14)
        return view
    }()
    
    let chatButton: UIButton = {
        let view = UIButton()
        let image = UIImage(systemName: "message.fill")
        view.setImage(image, for: .normal)
        view.tintColor = .lightGray
        return view
    }()
    
    let editProfileButton: UIButton = {
        let view = UIButton()
        let image = UIImage(systemName: "pencil")
        view.setImage(image, for: .normal)
        view.tintColor = .lightGray
     
        return view
    }()
    
    let kakaostoryButton: UIButton = {
        let view = UIButton()
        let image = UIImage(systemName: "magazine.fill")
        view.setImage(image, for: .normal)

        view.tintColor = .lightGray
        return view
    }()
    let chatLabel: UILabel = {
        let view = UILabel()
        view.text = "나와의 채팅"
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 10)
        return view
    }()
    let editLabel: UILabel = {
        let view = UILabel()
        view.text = "프로필 편집"
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 10)
        return view
    }()
    let kakaostoryLabel: UILabel = {
        let view = UILabel()
        view.text = "카카오스토리"
        view.textColor = .darkGray
        view.font = .systemFont(ofSize: 10)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLayout()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        editProfileButton.addTarget(self, action: #selector(moveToBaeminView), for: .touchUpInside)
        
        
    }
    
    func configureLayout() {
        [xbutton, settingButton ,presentButton, profileImageView, nameLabel, chatButton, editProfileButton, kakaostoryButton, chatLabel, editLabel, kakaostoryLabel].forEach { view.addSubview($0) }
        xbutton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leadingMargin.equalTo(20)
        }
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailingMargin.equalTo(-20)
        }
        presentButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailingMargin.equalTo(settingButton.snp.leading).offset(-20)
        }
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.8)
            make.height.width.equalTo(80)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(profileImageView.snp.bottom).offset(8)
        }
        chatButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(24)
            
            make.trailingMargin.equalTo(editProfileButton.snp.leading).offset(-80)
        }
        chatLabel.snp.makeConstraints { make in
            make.top.equalTo(chatButton.snp.bottom).offset(8)
            make.centerX.equalTo(chatButton.snp.centerX)
        }
        editProfileButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(24)
            make.centerX.equalTo(view.snp.centerX)
        }
        editLabel.snp.makeConstraints { make in
            make.top.equalTo(chatButton.snp.bottom).offset(8)
            make.centerX.equalTo(editProfileButton.snp.centerX)
        }
        kakaostoryButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(24)
            make.leadingMargin.equalTo(editProfileButton.snp.trailing).offset(80)
        }
        kakaostoryLabel.snp.makeConstraints { make in
            make.top.equalTo(chatButton.snp.bottom).offset(8)
            make.centerX.equalTo(kakaostoryButton.snp.centerX)
        }
    }
    @objc func moveToBaeminView() {
        let vc = BaeminViewController()
        vc.getProfileName = {
            self.nameLabel.text = vc.searchTextField.text
        }
        present(vc, animated: true)
    }
}

