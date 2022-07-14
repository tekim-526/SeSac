//
//  SecondViewController.swift
//  EmotionDiaryProject
//
//  Created by Kim TaeSoo on 2022/07/13.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var labelCollection: [UILabel]!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet var imageViewCollection: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        underiOSFourteen()
        datePickerView.locale = Locale(identifier: "ko_KR")
        for image in imageViewCollection {
            // MARK: - label에는 opacity를 안주는 방법이 뭘까..?
            // 해결 - 그냥 글자가 흰색이라 같이 투명해지는 것 처럼 보인것이었다,,
            image.layer.opacity = 0.8
        }
        labelSetting(labelCollection: labelCollection, date: Date())
    }
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        labelSetting(labelCollection: labelCollection, date: datePickerView.date)
    }
    func underiOSFourteen() {
        if #available(iOS 14.0, *) {
            datePickerView.preferredDatePickerStyle = .inline
        } else  {
            datePickerView.preferredDatePickerStyle = .wheels
        }
    }
    
    func labelSetting(labelCollection: [UILabel]!, date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년\nMM월 dd일"
        formatter.locale = Locale(identifier: "ko_KR")
        for label in labelCollection {
            switch label.tag {
            case 1:
                label.text = formatter.string(from: date.addingTimeInterval(60 * 60 * 24 * 100 * Double(label.tag)))
            case 2:
                label.text = formatter.string(from: date.addingTimeInterval(60 * 60 * 24 * 100 * Double(label.tag)))
            case 3:
                label.text = formatter.string(from: date.addingTimeInterval(60 * 60 * 24 * 100 * Double(label.tag)))
            case 4:
                label.text = formatter.string(from: date.addingTimeInterval(60 * 60 * 24 * 100 * Double(label.tag)))
            default:
                print("에러가 발생했습니다")
            }

        }
    }
    
}
