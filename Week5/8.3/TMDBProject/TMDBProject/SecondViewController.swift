//
//  SecondViewController.swift
//  TMDBProject
//
//  Created by Kim TaeSoo on 2022/08/16.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        UserDefaults.standard.setValue(true, forKey: "FirstStart")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
