//
//  ViewController.swift
//  NewlyCoinedWord
//
//  Created by Kim TaeSoo on 2022/07/08.
//

import UIKit
enum CoinedWord: String {
    case first = "어쩌라고 티비나봐"
    case second = "무슨일이니?"
    case third = "점심메뉴 추천좀"
    case fourth = "제목이 곧 내용"
    case fifth = "비쥬얼 담당"
}

class ViewController: UIViewController {
    
    @IBOutlet var keywordButtonList: [UIButton]!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var mainTextField: UITextField!
    
    let coinedWord: [String] = ["어쩔티비", "머선129", "점메추", "제곧내", "비담"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        for keywordButton in keywordButtonList {
            keywordButton.setTitle(coinedWord.randomElement(), for: .normal)
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
        resultLabel.textColor = .black
        if mainTextField.text == coinedWord[0] {
            resultLabel.text = CoinedWord.first.rawValue
        } else if mainTextField.text == coinedWord[1]{
            resultLabel.text = CoinedWord.second.rawValue
        } else if mainTextField.text == coinedWord[2] {
            resultLabel.text = CoinedWord.third.rawValue
        } else if mainTextField.text == coinedWord[3] {
            resultLabel.text = CoinedWord.fourth.rawValue
        } else if mainTextField.text == coinedWord[4] {
            resultLabel.text = CoinedWord.fifth.rawValue
        } else {
            resultLabel.textColor = .red
            resultLabel.text = "유효하지 않은 값 입니다. 다른 값을 넣어주세요"
        }
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        actionOfButtonAndReturn()
        for keywordButton in keywordButtonList {
            keywordButton.setTitle(coinedWord.randomElement(), for: .normal)
        }
    }
    
    //didEndOnExit
    @IBAction func returnKeyActivated(_ sender: UITextField) {
        actionOfButtonAndReturn()
        for keywordButton in keywordButtonList {
            keywordButton.setTitle(coinedWord.randomElement(), for: .normal)
        }
    }
}


