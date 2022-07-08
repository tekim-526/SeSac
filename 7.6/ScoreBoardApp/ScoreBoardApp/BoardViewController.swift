//
//  BoardViewController.swift
//  ScoreBoardApp
//
//  Created by Kim TaeSoo on 2022/07/06.
//

import UIKit

final class BoardViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var textColorButton: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var editView: UIView!
    
    @IBOutlet var buttonList: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        inputTextField.delegate = self
        mainLabel.text = ""
        mainLabel.numberOfLines = 0
        makeTFUI()
        makeBtnUI(buttonOutletVariableName: sendButton, btnTitle: "전송", highTitle: "빨리", .yellow)
        makeBtnUI(buttonOutletVariableName: textColorButton, btnTitle: "색상", highTitle: "빨리", .red)
        
        
    }
    // buttonOutletVariableName => 외부매개변수 ,Argument Label
    // buttonName => 내부 매개변수, Parameter Name
    // - : 와일드카드 식별자
    func makeBtnUI(buttonOutletVariableName buttonName: UIButton, btnTitle: String, highTitle: String, _ bgColor: UIColor) {
        buttonName.setTitle(btnTitle, for: .normal)
        buttonName.setTitle(highTitle, for: .highlighted)
        buttonName.backgroundColor = bgColor
        buttonName.layer.cornerRadius = 8
        buttonName.layer.borderColor = UIColor.black.cgColor
        buttonName.layer.borderWidth = 3
        buttonName.setTitleColor(.black, for: .normal)
        buttonName.setTitleColor(.blue, for: .highlighted)
    }
    func makeTFUI() {
        //inputTextField.text = "안녕하세요"
        inputTextField.placeholder = "내용을 작성해 주세요"
        inputTextField.keyboardType = .emailAddress
        inputTextField.font = .systemFont(ofSize: 15, weight: .bold)
        inputTextField.becomeFirstResponder()
    }
    func studyOutletCollection() {
        // 1. 반복문
        let buttonArray: [UIButton] = [sendButton, textColorButton]
        for item in  buttonArray {
            item.backgroundColor = .blue
            item.layer.cornerRadius = 2
        }
        
        // 2. 아웃렛 컬렉션 + 반복문
        for item in  buttonList {
            item.backgroundColor = .blue
            item.layer.cornerRadius = 2
        }
    }
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        mainLabel.text = inputTextField.text
        inputTextField.resignFirstResponder()
    }
    @IBAction func tapGestureForResignFirstResponder(_ sender: UITapGestureRecognizer) {
        // 키보드 내리기-1
        view.endEditing(true)
        // 키보드 내리기-2
        inputTextField.resignFirstResponder()
        
        editView.isHidden.toggle()
        
        
    }
    // 키보드 내리기-3
    @IBAction func didEndOnExit(_ sender: UITextField) {
    }
    

}

extension BoardViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        inputTextField.resignFirstResponder()
//        return true
//    }
}
