//
//  TransitionSecondViewController.swift
//  EmotionDiaryProject
//
//  Created by Kim TaeSoo on 2022/07/15.
//

import UIKit

class TransitionSecondViewController: UIViewController {

    @IBOutlet weak var mottoTextView: UITextView!
    /*
     1. 앱 킨다 데이터를 가지고와서 텍스트 뷰에 보여줘야함 (viewDidLoad, viewWillAppear)
     2. 바뀐 데이터를 저장해주어야 해요.
     => UserDefaults -> Key, Value
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TransitionSecondVC", #function)
        
        if UserDefaults.standard.string(forKey: "nickname") != nil {
            // 데이터 가져오기
            mottoTextView.text = UserDefaults.standard.string(forKey: "nickname")
        } else {
            // 데이터가 없는 경우에 사용할 문구
            mottoTextView.text = "김태수"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("TransitionSecondVC", #function)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("TransitionSecondVC", #function)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("TransitionSecondVC", #function)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("TransitionSecondVC", #function)
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(mottoTextView.text, forKey: "nickname")
        print("저장되었습니다!")
    }
}
