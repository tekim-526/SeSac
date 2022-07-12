//
//  ViewController.swift
//  EmotionDiaryProject
//
//  Created by Kim TaeSoo on 2022/07/11.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
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
        setLabel()
        showAlertController()
    }
    
    //Alert
    func showAlertController() {
        // 1.흰 바탕: UIAlertController
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
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

