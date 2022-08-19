//
//  WriteViewController.swift
//  SeSACWeek7Diary
//
//  Created by Kim TaeSoo on 2022/08/19.
//

import UIKit

import SnapKit

class WriteViewController: BaseViewController {
    
    var mainView = WriteView()
    
    // viewDidLoad보다 먼저 호출
    override func loadView() { // super.loadView 호출 X
        self.view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func configure() {
        print("WriteView", #function)
        mainView.titletextField.addTarget(self, action: #selector(didendexiton), for: .editingDidEndOnExit)
    }
    
    @objc func didendexiton(_ textField: UITextField) {
        guard let text = textField.text, text.count > 0 else {
            showAlertMessage(title: "제목을 입력해주세요")
            return
        }
    }
    
    
    
}
