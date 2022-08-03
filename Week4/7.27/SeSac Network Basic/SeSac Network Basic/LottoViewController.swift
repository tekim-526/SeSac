//
//  LottoViewController.swift
//  SeSac Network Basic
//
//  Created by Kim TaeSoo on 2022/07/28.
//

import UIKit

import Alamofire
import SwiftyJSON

class LottoViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    
    let lottoPickerView = UIPickerView()
    @IBOutlet var numbers: [UILabel]!
    
    
    let numberList: [Int] = Array(1...1025).reversed()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 인증번호
        numberTextField.textContentType = .oneTimeCode
        numberTextField.textAlignment = .center
        lottoPickerView.backgroundColor = .white
        numberTextField.inputView = lottoPickerView
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
        requestLotto(num: 1025)
    }
    func requestLotto(num: Int) {
        
        // AF: 200-299 status conde 301
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(num)"
        AF.request(url, method: .get).validate(statusCode: 200..<300).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let date = json["drwNoDate"].stringValue
                let numberArray = [json["drwtNo1"].intValue, json["drwtNo2"].intValue,
                                   json["drwtNo3"].intValue, json["drwtNo4"].intValue,
                                   json["drwtNo5"].intValue, json["drwtNo6"].intValue, json["bnusNo"].intValue]
                
                for label in self.numbers {
                    label.text = "\(numberArray[label.tag])"
                }
                self.numberTextField.text = date
//                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
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
        requestLotto(num: numberList[row])
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberList[row])회차"
    }
}

