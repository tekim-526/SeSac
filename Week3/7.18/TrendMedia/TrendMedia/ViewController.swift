//
//  ViewController.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!

    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateLabel2: UILabel!
    
    @IBOutlet var dateLabelCollection: [UILabel]!
    
    @IBOutlet weak var mintViewLeadingConstant: NSLayoutConstraint!
    
    let format = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        format.dateFormat = "yyyy/MM/dd"
        //mintViewLeadingConstant.constant = 120
    }
    func configureLabelDesign() {
        // 1.OutletCollection
        for i in dateLabelCollection {
            i.font = .boldSystemFont(ofSize: 20)
            i.textColor = .brown
        }
        dateLabelCollection[0].text = "첫번째 텍스트"
        dateLabelCollection[1].text = "두번째 텍스트"
        // 2.UILabel
        let labelArray = [dateLabel, dateLabel2]
        for i in labelArray {
            i?.font = .boldSystemFont(ofSize: 20)
            i?.textColor = .brown
        }
        
        dateLabel.text = "첫번째 텍스트"
        dateLabel2.text = "두번째 텍스트"
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dateLabel.text = format.string(from: sender.date)
    }
    
}

