//
//  RenameViewController.swift
//  Damagochi Project
//
//  Created by Kim TaeSoo on 2022/07/23.
//

import UIKit
import TextFieldEffects
import Toast

class RenameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var renameTextField: HoshiTextField!
    
    var model: Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = model.backGroundColor
        makeNavigationUI()
        
    }
    
    func makeNavigationUI() {
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(popView))
        leftBarButton.tintColor = .black

        navigationItem.leftBarButtonItem = leftBarButton
        navigationItem.leftBarButtonItem?.tintColor = model.textColor
        
        navigationItem.title = "대장님 이름 정하기"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: model.textColor]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(rename))
        navigationItem.rightBarButtonItem?.tintColor = model.textColor
    }
    
    @objc func rename() {
        if renameTextField.text!.count >= 2 && renameTextField.text!.count <= 6 {
            UserDefaults.standard.set(renameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), forKey: "captain")
            view.makeToast("저장되었습니다", duration: 1, position: .center) {_ in 
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            view.makeToast("공백포함 2글자 이상 6글자 이내로 설정하세요", duration: 1, position: .center)
        }
    }
    
    @objc func popView() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
