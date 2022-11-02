//
//  ViewController.swift
//  LoginWithServer
//
//  Created by Kim TaeSoo on 2022/11/02.
//

import UIKit

class ViewController: UIViewController {
    let baseView = View()
    
    let apiSetup = APISetup()
    
    override func loadView() {
        view = baseView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        baseView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        baseView.profileButton.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
    }
    
    @objc func signupButtonTapped() {
        if !baseView.nameTF.text!.isEmpty, !baseView.emailTF.text!.isEmpty, !baseView.passwdTF.text!.isEmpty {
            apiSetup.signup(
                username: baseView.nameTF.text!,
                email: baseView.emailTF.text!,
                password: baseView.passwdTF.text!
            ) {
                self.showAlert(alertStr: "Signup Completed")
            }
            
        } else {
            showAlert(alertStr: "Fill TextField!")
        }
    }
    
    @objc func loginButtonTapped() {
        if !baseView.emailTF.text!.isEmpty, !baseView.passwdTF.text!.isEmpty {
            apiSetup.login(email: baseView.emailTF.text!, password: baseView.passwdTF.text!) {
                self.showAlert(alertStr: "Login Succeed")
            }
        }
    }
    
    @objc func profileButtonTapped() {
        apiSetup.profile()
    }
    
    func showAlert(alertStr: String?) {
        let alert = UIAlertController(title: alertStr, message: alertStr, preferredStyle: .alert)
        let cancel = UIAlertAction(title: alertStr, style: .default)
        let ok = UIAlertAction(title: alertStr, style: .destructive)
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
}

