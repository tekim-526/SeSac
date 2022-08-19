//
//  LoginViewController.swift
//  8.19 Assignment
//
//  Created by Kim TaeSoo on 2022/08/19.
//

import UIKit

class LoginViewController: BaseViewController {
    let loginView = LoginView()
    
    override func loadView() {
        self.view = loginView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        loginView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    @objc func signUpButtonTapped() {
        present(MainViewController(), animated: true)
    }
    override func makeConstraints() { }
}
