//
//  ViewController.swift
//  EmotionDiaryProject
//
//  Created by Kim TaeSoo on 2022/07/11.
//

import UIKit
enum UserDefaultsKey: String {
    case num
}
class ViewController: UIViewController {
    var nums = Array(repeating: 0, count: 9)
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    
    @IBOutlet weak var emotionCountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        
        emotionCountLabel.text = "\(UserDefaults.standard.integer(forKey: UserDefaultsKey.num.rawValue))"
    }
    
    func setLabel() {
        label1.text = "\(nums[0])"
        label2.text = "\(nums[1])"
        label3.text = "\(nums[2])"
        label4.text = "\(nums[3])"
        label5.text = "\(nums[4])"
        label6.text = "\(nums[5])"
        label7.text = "\(nums[6])"
        label8.text = "\(nums[7])"
        label9.text = "\(nums[8])"
    }
    
    // tag를 활용해서 리팩토링 해보자
    @IBAction func buttonAction(_ sender: UIButton) {
        switch sender.tag {
        case 0: nums[0] += 1
        case 1: nums[1] += 1
        case 2: nums[2] += 1
        case 3: nums[3] += 1
        case 4: nums[4] += 1
        case 5: nums[5] += 1
        case 6: nums[6] += 1
        case 7: nums[7] += 1
        case 8: nums[8] += 1
        default:
            nums = Array(repeating: 0, count: 9)
            setLabel()
        }
        setLabel()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        nums = Array(repeating: 0, count: 9)
        UserDefaults.standard.set(0, forKey: UserDefaultsKey.num.rawValue)
        emotionCountLabel.text = "\(UserDefaults.standard.integer(forKey: UserDefaultsKey.num.rawValue))"
        // 제거
        // UserDefaults.standard.removeObject(forKey: UserDefaultsKey.num.rawValue)
        // 전체제거
        //for key in UserDefaults.standard.dictionaryRepresentation().keys {
        //    UserDefaults.standard.removeObject(forKey: key.description)
        //}
        setLabel()
        showAlertController()
    }
    
    @IBAction func upButtonTapped(_ sender: UIButton) {
        // 기존 데이터값 가져오기
        let currentValue = UserDefaults.standard.integer(forKey: UserDefaultsKey.num.rawValue)
        // 감정 + 1
        let updateValue = currentValue + 1
        // 새로운 값 저장
        UserDefaults.standard.set(updateValue, forKey: UserDefaultsKey.num.rawValue)
        // 레이블에 새로운 내용 보여주기
        emotionCountLabel.text = "\(updateValue)"
    }
    
    //Alert
    func showAlertController() {
        // 1.흰 바탕: UIAlertController
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        // 2.버튼
        let ok = UIAlertAction(title: "확인", style: .destructive, handler: nil)
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        let web = UIAlertAction(title: "web", style: .default)
        let copy = UIAlertAction(title: "copy", style: .default)
        
        // 3. 1+2
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.addAction(web)
        alert.addAction(copy)
        
        // 4. present
        present(alert, animated: true)
    }
}

