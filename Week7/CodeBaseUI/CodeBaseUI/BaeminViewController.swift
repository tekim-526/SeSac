//
//  BaeminViewController.swift
//  CodeBaseUI
//
//  Created by Kim TaeSoo on 2022/08/17.
//

import UIKit

import SnapKit

class BaeminViewController: UIViewController {
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemMint
        view.layer.cornerRadius = 10
        return view
    }()
    let locationLabel: UILabel = {
        let view = UILabel()
        view.text = "우리집"
        view.textColor = .white
        view.font = .systemFont(ofSize: 20, weight: .heavy)
        return view
    }()
    let fourSquareButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "grid"), for: .normal)
        view.tintColor = .white
        return view
    }()
    let alertButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "bell"), for: .normal)
        view.tintColor = .white
        return view
    }()
    let myPageButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "smile"), for: .normal)
        view.tintColor = .white
        return view
    }()
    let textFieldView: UIView = {
        let view = UIView()

        return view
    }()
    let magnifyingglassButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        view.tintColor = .white
        view.backgroundColor = .clear
        return view
    }()
    let searchTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .white
        view.contentHorizontalAlignment = .left
        view.layer.cornerRadius = 3
        return view
    }()
    let baedalImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "delivery")
        view.contentMode = .scaleToFill
        return view
    }()
    let baeminOneImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "baemin1")
        view.contentMode = .scaleToFill
        return view
    }()
    let togoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "takeout")
        view.contentMode = .scaleToFill
        return view
    }()
    let bmartImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "bmart")
        view.contentMode = .scaleToFill
        return view
    }()
    let shoppingLiveImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "shoppinglive")
        view.contentMode = .scaleToFill
        return view
    }()
    let presentImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "gift")
        view.contentMode = .scaleToFill
        return view
    }()
    let specialImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "special")
        view.contentMode = .scaleToFill
        return view
    }()
    let bannerImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "main_banner")
        view.contentMode = .scaleToFill
        return view
    }()
    
    var getProfileName: (() ->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(spacing: 12)
        configuretopViewUI()
        magnifyingglassButton.addTarget(self, action: #selector(magnifyingglassButtonTapped), for: .touchUpInside)
        view.backgroundColor = .white
    }
   
    
    func configureUI(spacing: Double) {
        [topView, baedalImageView, baeminOneImageView, togoImageView, bmartImageView, shoppingLiveImageView, presentImageView, specialImageView, bannerImageView].forEach { view.addSubview($0) }
        topView.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.snp.height).multipliedBy(0.15)
        }
        baedalImageView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(spacing)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(spacing)
            
        }
        baeminOneImageView.snp.makeConstraints { make in
            make.top.equalTo(baedalImageView.snp.top)
            make.leading.equalTo(baedalImageView.snp.trailing).offset(spacing)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-spacing)
        }
        togoImageView.snp.makeConstraints { make in
            make.top.equalTo(baedalImageView.snp.bottom).offset(spacing)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(spacing)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-spacing)
        }
        bmartImageView.snp.makeConstraints { make in
            make.top.equalTo(togoImageView.snp.bottom).offset(spacing)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(spacing)
        }
        shoppingLiveImageView.snp.makeConstraints { make in
            make.top.equalTo(bmartImageView.snp.top)
            make.leading.equalTo(bmartImageView.snp.trailing).offset(spacing)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-spacing)
            make.height.equalTo(bmartImageView.snp.height)
        }
        presentImageView.snp.makeConstraints { make in
            make.top.equalTo(shoppingLiveImageView.snp.bottom).offset(spacing)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(spacing)
            make.trailing.equalTo(bmartImageView.snp.trailing)
            make.height.equalTo(presentImageView.snp.width)
        }
        specialImageView.snp.makeConstraints { make in
            make.top.equalTo(presentImageView.snp.top)
            make.leading.equalTo(presentImageView.snp.trailing).offset(spacing)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-spacing)
            make.height.equalTo(presentImageView.snp.width)
        }
        bannerImageView.snp.makeConstraints { make in
            make.top.equalTo(specialImageView.snp.bottom).offset(spacing)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(spacing)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-spacing)
        }
    }
    
    func configuretopViewUI() {
        configureTextFieldView()
        
        [locationLabel, fourSquareButton, alertButton, myPageButton, textFieldView].forEach { topView.addSubview($0) }
        
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(20)
        }
        myPageButton.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.top)
            make.trailing.equalTo(-20)
        }
        fourSquareButton.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.top)
            make.trailing.equalTo(alertButton.snp.leading).offset(-12)
        }
        alertButton.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.top)
            make.trailing.equalTo(myPageButton.snp.leading).offset(-12)
        }
        
        textFieldView.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(12)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(topView.snp.height).multipliedBy(0.3)
        }
    }
    func configureTextFieldView() {
        [magnifyingglassButton, searchTextField].forEach { someView in
            textFieldView.addSubview(someView)
        }
        magnifyingglassButton.snp.makeConstraints { make in
            make.top.leading.bottom.equalTo(0)
            make.height.width.equalTo(textFieldView.snp.height)
        }
        searchTextField.snp.makeConstraints { make in
            make.leading.equalTo(magnifyingglassButton.snp.trailing).offset(4)
            make.top.bottom.trailing.equalTo(0)
        }
        
    }
    @objc func magnifyingglassButtonTapped() {
        getProfileName?()
        dismiss(animated: true)
    }
    
}
