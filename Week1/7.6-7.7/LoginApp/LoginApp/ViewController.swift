//
//  ViewController.swift
//  LoginApp
//
//  Created by Kim TaeSoo on 2022/07/06.
//

import UIKit

enum UserDefaultsKeys: String {
    case emailTF
    case passwdTF
    
    case themeSwitch
}

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
        textFieldUI(textField: nicknameTF, placeHolder: "Nickname")
        textFieldUI(textField: loactionTF, placeHolder: "Location")
        textFieldUI(textField: codeTF, placeHolder: "Code")
        
        themeSwitch.isOn = UserDefaults.standard.bool(forKey: UserDefaultsKeys.themeSwitch.rawValue)
        // 스위치가 온일경우 이메일과 패스워드 저장
        if themeSwitch.isOn {
            emailTF.text = UserDefaults.standard.string(forKey: UserDefaultsKeys.emailTF.rawValue)
            passwdTF.text = UserDefaults.standard.string(forKey: UserDefaultsKeys.passwdTF.rawValue)
        }
        extraUI()
    }
    
    @IBAction func switchTapped(_ sender: UISwitch) {
        // 텍스트 저장을 위한 플래그(?)
        UserDefaults.standard.set(themeSwitch.isOn, forKey: UserDefaultsKeys.themeSwitch.rawValue)
    }
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        if emailTF.text != "" && passwdTF.text!.count >= 6{
            resignFirstResponder()
        } else {
            let alert = UIAlertController(title: "오류", message: "유효하지 않은 값입니다", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default) { alertAction in
                // 뒤로 돌아가는 코드
            }

            
            alert.addAction(ok)
            present(alert, animated: true)
            
        }
        
        // 이메일과 패스워드를 남겨놓기 위한 UserDefaults
        if themeSwitch.isOn {
            UserDefaults.standard.set(emailTF.text, forKey: UserDefaultsKeys.emailTF.rawValue)
            UserDefaults.standard.set(passwdTF.text, forKey: UserDefaultsKeys.passwdTF.rawValue)
        }
    }
    
    func textFieldUI(textField: UITextField, placeHolder: String) {
        textField.placeholder = placeHolder
        textField.backgroundColor = .black
        textField.textColor = .white
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

