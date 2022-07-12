//
//  SegmentedViewController.swift
//  EmotionDiaryProject
//
//  Created by Kim TaeSoo on 2022/07/12.
//

import UIKit

enum MuisicType: Int {
    case all = 0
    case korea
    case foreignCountry
}

class SegmentedViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        segmendControlValueChanged(segmentedControl)
        
    }
    
    @IBAction func segmendControlValueChanged(_ sender: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == MuisicType.all.rawValue {
            resultLabel.text = "first"
        } else if segmentedControl.selectedSegmentIndex == MuisicType.korea.rawValue {
            resultLabel.text = "second"
        } else if segmentedControl.selectedSegmentIndex == MuisicType.foreignCountry.rawValue {
            resultLabel.text = "third"
        } else {
            resultLabel.text = "Error"
        }
        if segmentedControl.selectedSegmentIndex == 0 { }
        else if segmentedControl.selectedSegmentIndex == 1 { }
        else if segmentedControl.selectedSegmentIndex == 2 { }
        else { }
    }
    
    

}
