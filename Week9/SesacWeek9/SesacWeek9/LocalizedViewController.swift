//
//  LocalizedViewController.swift
//  SesacWeek9
//
//  Created by Kim TaeSoo on 2022/09/06.
//

import UIKit
import MessageUI // 메일로 문의 보내기, 디바이스 테스트, 아이폰 메일 계정을 등록 해야 가능
class LocalizedViewController: UIViewController, MFMailComposeViewControllerDelegate {

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var sampleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "introduce".localized(with: "tekim")
        inputTextField.text = String(format: NSLocalizedString("number_text", comment: ""), 26)
        navigationItem.title = NSLocalizedString("navigation_title", comment: "이거 어디에 활용 될거야라는 코멘트 작성")
        searchBar.placeholder = NSLocalizedString("search_placeholder", comment: "")
        inputTextField.placeholder = NSLocalizedString("textField_placeholder", comment: "")
        let buttonTitle = NSLocalizedString("common_cancel", comment: "")
        sampleButton.setTitle(buttonTitle, for: .normal)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sendMail()
    }
    func sendMail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.setToRecipients(["42.4.tekim@gmail.com"])
            mail.setSubject("크로스핏 다이어리 문의사항 -")
            mail.mailComposeDelegate = self
            self.present(mail, animated: true)
        } else {
            print("ALERT")
        }
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result {
        case .cancelled:
            
        case .saved:
            
        case .sent:
            
        case .failed:
            
        }
        controller.dismiss(animated: true)
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    func localized<T>(with: T) -> String {
        return String(format: self.localized, with as! CVarArg)
    }
    func localized(number: Int) -> String {
        return String(format: self.localized, number)
    }
}
