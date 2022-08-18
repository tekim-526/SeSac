//
//  UIViewController+Extension.swift
//  SeSACWeek7Diary
//
//  Created by Kim TaeSoo on 2022/08/18.
//

import UIKit

extension UIViewController {
    func transitionViewController<T: UIViewController>(storyboardName: String, viewController vc: T) {
        let sb = UIStoryboard(name: storyboardName, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: vc)) as? T else { return }
        self.present(vc, animated: true)
    }
}
