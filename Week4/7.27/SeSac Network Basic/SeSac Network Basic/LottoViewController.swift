//
//  LottoViewController.swift
//  SeSac Network Basic
//
//  Created by Kim TaeSoo on 2022/07/28.
//

import UIKit

class LottoViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    
    let lottoPickerView = UIPickerView()
    
    let numberList: [Int] = Array(1...1025).reversed()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lottoPickerView.backgroundColor = .white
        numberTextField.inputView = lottoPickerView
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
        
    }
    
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberList.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberTextField.text = "\(numberList[row])회차"
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
}

