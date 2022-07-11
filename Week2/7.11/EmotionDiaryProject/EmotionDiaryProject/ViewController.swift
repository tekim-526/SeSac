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
    
    @IBAction func btn1Tapped(_ sender: UIButton) {
        nums[0] += 1
        label1.text = "\(nums[0])"
    }
    @IBAction func btn2Tapped(_ sender: UIButton) {
        nums[1] += 1
        label2.text = "\(nums[1])"
    }
    @IBAction func btn3Tapped(_ sender: UIButton) {
        nums[2] += 1
        label3.text = "\(nums[2])"
    }
    @IBAction func btn4Tapped(_ sender: UIButton) {
        nums[3] += 1
        label4.text = "\(nums[3])"
    }
    @IBAction func btn5Tapped(_ sender: UIButton) {
        nums[4] += 1
        label5.text = "\(nums[4])"
    }
    @IBAction func btn6Tapped(_ sender: UIButton) {
        nums[5] += 1
        label6.text = "\(nums[5])"
    }
    @IBAction func btn7Tapped(_ sender: UIButton) {
        nums[6] += 1
        label7.text = "\(nums[6])"
    }
    @IBAction func btn8Tapped(_ sender: UIButton) {
        nums[7] += 1
        label8.text = "\(nums[7])"
    }
    @IBAction func btn9Tapped(_ sender: UIButton) {
        nums[8] += 1
        label9.text = "\(nums[8])"
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        nums = Array(repeating: 0, count: 9)
        setLabel()
    }
    
    
}

