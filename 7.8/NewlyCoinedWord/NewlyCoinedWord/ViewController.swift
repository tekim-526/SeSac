//
//  ViewController.swift
//  NewlyCoinedWord
//
//  Created by Kim TaeSoo on 2022/07/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var keywordButtonList: [UIButton]!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var mainTextField: UITextField!
    
    let coinedWord: [(String, String)] = [("어쩔티비", "어쩌라고 티비나봐"), ("머선129", "무슨일이니?"), ("점메추","점심메뉴 추천좀"), ("제곧내","제목이 곧 내용"), ("비담","비쥬얼 담당")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI() {
        for keywordButton in keywordButtonList {
            keywordButton.setTitle(coinedWord.randomElement()?.0, for: .normal)
            keywordButton.layer.cornerRadius = 5
            keywordButton.layer.borderWidth = 1.5
            keywordButton.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
            keywordButton.tintColor = .black
        }
        mainTextField.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        mainTextField.layer.borderWidth = 2
        mainTextField.layer.cornerRadius = 5
    }
    
    func actionOfButtonAndReturn() {
        if mainTextField.text == coinedWord[0].0 {
            resultLabel.text = coinedWord[0].1
            resultLabel.textColor = .black
        } else if mainTextField.text == coinedWord[1].0{
            resultLabel.text = coinedWord[1].1
            resultLabel.textColor = .black
        } else if mainTextField.text == coinedWord[2].0 {
            resultLabel.text = coinedWord[2].1
            resultLabel.textColor = .black
        } else if mainTextField.text == coinedWord[3].0 {
            resultLabel.text = coinedWord[3].1
            resultLabel.textColor = .black
        } else if mainTextField.text == coinedWord[4].0 {
            resultLabel.text = coinedWord[4].1
        } else {
            resultLabel.textColor = .red
            resultLabel.text = "유효하지 않은 값 입니다. 다른 값을 넣어주세요"
        }
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        actionOfButtonAndReturn()
        for keywordButton in keywordButtonList {
            keywordButton.setTitle(coinedWord.randomElement()?.0, for: .normal)
        }
    }
    
    //didEndOnExit
    @IBAction func returnKeyActivated(_ sender: UITextField) {
        actionOfButtonAndReturn()
        for keywordButton in keywordButtonList {
            keywordButton.setTitle(coinedWord.randomElement()?.0, for: .normal)
        }
    }
}


