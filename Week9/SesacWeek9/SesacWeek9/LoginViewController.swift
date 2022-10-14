//
//  LoginViewController.swift
//  SesacWeek9
//
//  Created by Kim TaeSoo on 2022/09/01.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.name.bind { text in
            self.nameTextField.text = text
        }
        viewModel.email.bind { text in
            self.emailTextField.text = text
        }
        viewModel.password.bind { text in
            self.passwordTextField.text = text
        }
        viewModel.isValid.bind { bool in
            self.loginButton.isEnabled = bool
            self.loginButton.backgroundColor = bool ? .red : .lightGray
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        viewModel.signIn {
            // view transition
        }
    }
    @IBAction func nameTextFieldActivated(_ sender: UITextField) {
        viewModel.name.value = nameTextField.text!
        viewModel.checkValidation()
    }

    @IBAction func emailTextFieldActivated(_ sender: UITextField) {
        viewModel.email.value = emailTextField.text!
        viewModel.checkValidation()
    }
    
    @IBAction func passwordTextFieldActivated(_ sender: UITextField) {
        viewModel.password.value = passwordTextField.text!
        viewModel.checkValidation()
    }
    
    
}
