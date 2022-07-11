//
//  ViewController.swift
//  SesacWeek2
//
//  Created by Kim TaeSoo on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleLabel: UILabel!
    @IBOutlet weak var blueView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleLabel.clipsToBounds = false
        sampleLabel.layer.cornerRadius = 50
        // clipsToBounds vs cornerRadius vs shadow
    }


}

