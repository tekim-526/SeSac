//
//  FirstViewController.swift
//  SeSACWeek7Diary
//
//  Created by Kim TaeSoo on 2022/08/16.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tutorialLabel: UILabel!
    
    @IBOutlet weak var blackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var blackView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tutorialLabel.numberOfLines = 2
        tutorialLabel.font = .boldSystemFont(ofSize: 25)
        tutorialLabel.text = """
                                일기 씁시다!
                                잘 써봅시다!
                                """
        tutorialLabel.alpha = 0
        
        blackView.backgroundColor = .black
//        blackView.alpha = 0
        
        UIView.animate(withDuration: 1.5) {
            self.tutorialLabel.alpha = 1
        } completion: { value in
            self.blackViewAnimation()
        }
        
    }
    func blackViewAnimation() {
        
    }
}
