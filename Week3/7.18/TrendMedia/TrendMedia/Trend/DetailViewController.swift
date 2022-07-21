//
//  DetailViewController.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/21.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushButtonTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "WebViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}
