//
//  ClosureViewController.swift
//  SesacWeek6
//
//  Created by Kim TaeSoo on 2022/08/08.
//

import UIKit

class ClosureViewController: UIViewController {

    @IBOutlet weak var cardView: CardView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cardView.posterImageView.backgroundColor = .red
        cardView.likeButton.backgroundColor = .yellow
        cardView.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
    }
    @objc func likeButtonClicked() {
        print("button tapped")
    }

    @IBAction func colorpickerButtonCliked(_ sender: UIButton) {
        showAlert(title: "컬러피커를 띄우시겠습니까?", message: nil, okTitle: "띄우기") {
            let picker = UIColorPickerViewController()
            self.present(picker, animated: true)
            
            self.view.backgroundColor = .gray
        }
    }
    
    @IBAction func backkgroundColorChanged(_ sender: UIButton) {
        showAlert(title: "배경색 변경", message: "변경할래?", okTitle: "네") {
            self.view.backgroundColor = .gray
        }
    }
    

}
extension UIViewController {
    func showAlert(title: String, message: String?, okTitle: String, okAction: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "cnl", style: .cancel)
        let ok = UIAlertAction(title: okTitle, style: .default) { alert in
            okAction()
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
