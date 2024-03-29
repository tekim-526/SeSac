//
//  TranslateViewController.swift
//  SeSac Network Basic
//
//  Created by Kim TaeSoo on 2022/07/28.
//

import UIKit

// UIButton, UITextField > Action
// UITextView, UISearchBar, UIPickerView > X
// UIControl
// UIResponderChain > becomeFirstResponder() / resignFirstResponder()

class TranslateViewController: UIViewController {

    @IBOutlet weak var userInputTextView: UITextView!
    
    let textViewPlaceholderText = "텍스트 필드를 입력해 주세요"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInputTextView.delegate = self
//        userInputTextView.text = textViewPlaceholderText
//        userInputTextView.textColor = .lightGray
//        userInputTextView.font = UIFont(name: "HSSaemaul", size: 16)
//        userInputTextView.dataDetectorTypes = .link
        
        let attributedTitle = NSMutableAttributedString(string: "Please Input Text  ")
        attributedTitle.imgStr()
        userInputTextView.attributedText = attributedTitle
        userInputTextView.dataDetectorTypes = .phoneNumber
        userInputTextView.isEditable = false
        
        
    }
    
    

}

extension TranslateViewController: UITextViewDelegate {
    // 텍스트뷰의 텍스트가 변할 때마다 호출
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
    }
    
    // 편집이 시작될 때, 커서가 시작될 때
    // 텍스트뷰 글자: 플레이스 홀더랑 글자가 같으면 clear, color 변경
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            userInputTextView.text = nil
            userInputTextView.textColor = .black
        }
        
        print("begin")
    }
    
    // 편집이 끝났을 때, 커서가 없어지는 순간
    // 텍스트뷰 글자: 사용자가 아무 글자도 안 썼으면 플레이스 홀더 글자 보이게 해!
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            userInputTextView.text = textViewPlaceholderText
            userInputTextView.textColor = .lightGray
        }
        
        print("end")
    }
}
extension NSMutableAttributedString {
    func imgStr() {
        let imageAttatchment = NSTextAttachment()
        imageAttatchment.image = UIImage(systemName: "checkmark")
        let strImg = NSAttributedString(attachment: imageAttatchment)
        self.append(strImg)
    }
}
