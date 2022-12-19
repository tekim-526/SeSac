//
//  LoginViewController.swift
//  InAppPurchaseTest
//
//  Created by Kim TaeSoo on 2022/11/29.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPassword: UITextField!
    
    var user = User(email: "", passsword: "", check: "")
    var validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.accessibilityIdentifier = "descriptionLabel"
    }
    

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        descriptionLabel.text = "login Button Tapped!"
        
        user = User(email: emailTextField.text!, passsword: passwordTextField.text!, check: checkPassword.text!)
        if validator.isValidEmail(email: user.email) && validator.isValidPassword(password: user.passsword) && validator.isEqualPassword(password: user.passsword, check: user.check) {
            print("로그인 성공")
        } else { print("로그인 실패")}
    }
    
    
    func isValidEmail() -> Bool {
        guard let email = emailTextField.text else {return false}
        return email.contains("@") && email.count > 8
    }
    
    func isValidPassword() -> Bool {
        guard let password = passwordTextField.text else {return false}
        return password.count >= 6 && password.count < 12
    }
    
    func isEqualPassword() -> Bool {
        guard let password = passwordTextField.text, let check = checkPassword.text else {return false}
        return password == check
    }

}

final class Validator {
    func isValidEmail(email: String) -> Bool {
        return email.contains("@") && email.count > 8
    }
    func isValidPassword(password: String) -> Bool {
        return password.count >= 6 && password.count < 12
    }
    
    func isEqualPassword(password: String, check: String) -> Bool {
        return password == check
    }
}

struct User {
    let email: String
    let passsword: String
    let check: String
}
