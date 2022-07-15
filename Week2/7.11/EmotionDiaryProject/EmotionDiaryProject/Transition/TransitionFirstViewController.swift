//
//  TransitionFirstViewController.swift
//  EmotionDiaryProject
//
//  Created by Kim TaeSoo on 2022/07/15.
//

import UIKit

class TransitionFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    @IBAction func unwindTransitionFirstVC(segue: UIStoryboardSegue) {
        
    }


}
