//
//  MainViewController.swift
//  Damagochi Project
//
//  Created by Kim TaeSoo on 2022/07/22.
//

import UIKit
import TextFieldEffects

class MainViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var bubbleImage: UIImageView!
    @IBOutlet weak var damagochiImage: UIImageView!
    
    @IBOutlet weak var bubbleLabel: UILabel!
    @IBOutlet weak var damagochiNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var riceTextField: HoshiTextField!
    @IBOutlet weak var waterTextField: HoshiTextField!
    
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    let model = Model()

    var riceCount = UserDefaults.standard.double(forKey: "rice") >= 9999.0 ? 9999.0 : UserDefaults.standard.double(forKey: "rice")
    var waterCount = UserDefaults.standard.double(forKey: "water") >= 9999.0 ? 9999.0 : UserDefaults.standard.double(forKey: "water")
    var level: Int {
        let temp = (riceCount / 5 + waterCount / 2) / 10
        if temp >= 10 {
            return 10
        } else if temp < 10 && temp >= 1 {
            return Int(temp)
        } else {
            return 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = model.backGroundColor
        UserDefaults.standard.set(true ,forKey: "reset")
        
        riceTextField.delegate = self
        waterTextField.delegate = self
        
        navigationBarUI()
        makeUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "\(UserDefaults.standard.string(forKey: "captain") ?? "대장")님의 다마고치"
    }
    
    @objc func settingButtonTapped() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as? SettingTableViewController else { return }
        vc.model = model
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    @IBAction func eatButtonTapped(_ sender: UIButton) {
        refreshView(senderTag: sender.tag)
    }
}

extension MainViewController {
    
    func navigationBarUI() {
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: model.textColor]
        navigationItem.hidesBackButton = true
        navigationItem.title = "\(UserDefaults.standard.string(forKey: "captain") ?? "대장")님의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(settingButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = model.buttonColor
    }
    
    func makeUI() {
        riceCount = UserDefaults.standard.double(forKey: "rice") >= 9999.0 ? 9999.0 : UserDefaults.standard.double(forKey: "rice")
        waterCount = UserDefaults.standard.double(forKey: "water") >= 9999.0 ? 9999.0 : UserDefaults.standard.double(forKey: "water")
        
        bubbleImage.image = UIImage(named: "bubble")
        bubbleLabel.textAlignment = .center
        
        statusLabel.text = "LV\(level) · 밥알 \(Int(riceCount))개 · 물방울 \(Int(waterCount))개"
        statusLabel.textColor = model.textColor
        
        bubbleLabel.text = model.mentionArray.randomElement()
        bubbleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        bubbleLabel.textColor = model.textColor
        bubbleLabel.numberOfLines = 0
        
        riceTextField.placeholder = "밥줘 응애~(0 ~ 99)"
        riceTextField.keyboardType = .numberPad
        
        waterTextField.placeholder = "물줘 응애~(0 ~ 49)"
        waterTextField.keyboardType = .numberPad
        
        riceButton.setTitle("밥먹기", for: .normal)
        riceButton.tintColor = model.textColor
        
        waterButton.setTitle("물먹기", for: .normal)
        waterButton.tintColor = model.textColor
        
        damagochiNameLabel.text = UserDefaults.standard.string(forKey: "name")
        
        model.boxedNameLabelUI(label: damagochiNameLabel)
       
        damagochiImage.image = UIImage(named: "\(UserDefaults.standard.integer(forKey: "imageRow") + 1)-\(level <= 9 ? level : 9)")
    }
    
    func levelCalculate(tag: Int) {
        if let riceTextfieldNum = Double(riceTextField.text ?? ""), tag == 0 {
            if riceTextfieldNum >= 100 {
                view.makeToast("유효한 값을 입력해주세요", position: .center)
                return
            }
            UserDefaults.standard.set(UserDefaults.standard.double(forKey: "rice") + riceTextfieldNum, forKey: "rice")
            riceCount = UserDefaults.standard.double(forKey: "rice") >= 9999.0 ? 9999.0 : UserDefaults.standard.double(forKey: "rice")
        }
        
        else if let waterTextfieldNum = Double(waterTextField.text ?? ""), tag == 1 {
            if waterTextfieldNum >= 50 {
                view.makeToast("유효한 값을 입력해주세요", position: .center)
                return
            }
            UserDefaults.standard.set(UserDefaults.standard.double(forKey: "water") + waterTextfieldNum, forKey: "water")
            waterCount = UserDefaults.standard.double(forKey: "water") >= 9999.0 ? 9999.0 : UserDefaults.standard.double(forKey: "water")
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string >= "0" && string <= "9") || string.isEmpty {
            return true
        }
        return false
    }
    func refreshView(senderTag: Int) {
        if waterTextField.text != "" || riceTextField.text != "" {
        levelCalculate(tag: senderTag)
        waterTextField.text = ""
        riceTextField.text = ""
        statusLabel.text = "LV\(Int(level)) · 밥알 \(Int(riceCount))개 · 물방울 \(Int(waterCount))개"
        damagochiImage.image = UIImage(named: "\(UserDefaults.standard.integer(forKey: "imageRow") + 1)-\(level <= 9 ? level : 9)")
        bubbleLabel.text = model.mentionArray.randomElement()
        }
    }
}
