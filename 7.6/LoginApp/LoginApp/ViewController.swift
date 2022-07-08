//
//  ViewController.swift
//  LoginApp
//
//  Created by Kim TaeSoo on 2022/07/06.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwdTF: UITextField!
    @IBOutlet weak var nicknameTF: UITextField!
    @IBOutlet weak var loactionTF: UITextField!
    @IBOutlet weak var codeTF: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var extraInfoButton: UIButton!
    @IBOutlet weak var themeSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        codeTF.delegate = self
        textFieldUI(textField: emailTF, placeHolder: "E-MAIL OR PHONE NUMBER")
        textFieldUI(textField: passwdTF, placeHolder: "Password")
        textFieldUI(textField: nicknameTF, placeHolder: "nickname")
        textFieldUI(textField: loactionTF, placeHolder: "location")
        textFieldUI(textField: codeTF, placeHolder: "code")
        extraUI()
    }
    
    @IBAction func switchTapped(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = .black
        } else {
            view.backgroundColor = .white
        }
    }
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        if emailTF.text != "" && passwdTF.text!.count >= 6{
            view.endEditing(true)
        }
        
    }
    
    func textFieldUI(textField: UITextField, placeHolder: String) {
        textField.placeholder = placeHolder
        textField.textAlignment = .center
        textField.backgroundColor = .lightGray

        passwdTF.textContentType = .newPassword
        passwdTF.isSecureTextEntry = true

        codeTF.keyboardType = .numberPad
        
    }
    func extraUI() {
        mainLabel.text = "KIMFLIX"
        mainLabel.textColor = .red

        view.backgroundColor = .black

        signUpButton.backgroundColor = .white
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        signUpButton.layer.cornerRadius = 5
        
        extraInfoButton.setTitle("추가 정보 입력", for: .normal)
        extraInfoButton.setTitleColor(.gray, for: .normal)

        themeSwitch.setOn(true, animated: true)
        themeSwitch.onTintColor = .red
        themeSwitch.thumbTintColor = .yellow
        themeSwitch.backgroundColor = .clear
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty || string >= "0" && string <= "9" {
            return true
        }
        return false
    }
}

