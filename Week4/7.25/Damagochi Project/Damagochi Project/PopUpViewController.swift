//
//  ViewController.swift
//  Damagochi Project
//
//  Created by Kim TaeSoo on 2022/07/22.
//

import UIKit

class PopUpViewController: UIViewController {
    var row: Int!
    var navigation: UINavigationController?
    var motherView: UIView!

    let model = Model()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var damagochiNameLabel: UILabel!
    @IBOutlet weak var damagochiDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    func makeUI() {
        damagochiDescription.text = model.descriptionArray[row]
        damagochiDescription.numberOfLines = 0
        damagochiDescription.textAlignment = .center
        damagochiDescription.textColor = model.textColor

        popUpView.backgroundColor = model.backGroundColor
        popUpView.layer.cornerRadius = 30
        popUpView.clipsToBounds = true
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.tintColor = model.textColor
        cancelButton.layer.borderWidth = 0.5
        cancelButton.layer.borderColor = UIColor.lightGray.cgColor

        startButton.setTitle(UserDefaults.standard.bool(forKey: "reset") ? "변경하기" : "시작하기", for: .normal)

        startButton.tintColor = model.textColor
        startButton.layer.borderWidth = 0.5
        startButton.layer.borderColor = UIColor.lightGray.cgColor
        
        imageView.image = Damagochi.allCases[row].imageAsset
        damagochiNameLabel.text = Damagochi.allCases[row].damagochiName
        
        model.boxedNameLabelUI(label: damagochiNameLabel)
    }
    
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        motherView.layer.opacity = 1
        dismiss(animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
        
        if !UserDefaults.standard.bool(forKey: "reset") {
            setUserDefault()
        } else {
            UserDefaults.standard.set(row, forKey: "imageRow")
            UserDefaults.standard.set(damagochiNameLabel.text, forKey: "name")
        }
        dismiss(animated: true)
        navigation?.pushViewController(vc, animated: true)
    }
    
    func setUserDefault() {
        UserDefaults.standard.set(false, forKey: "reset")
        UserDefaults.standard.set("대장", forKey: "captain")
        UserDefaults.standard.set(Double(0), forKey: "rice")
        UserDefaults.standard.set(Double(0), forKey: "water")
        UserDefaults.standard.set(row, forKey: "imageRow")
        UserDefaults.standard.set(damagochiNameLabel.text, forKey: "name")

    }
}

