//
//  Utils.swift
//  TMDBProject
//
//  Created by Kim TaeSoo on 2022/08/03.
//

import UIKit

protocol ReuseIdentifier {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: ReuseIdentifier {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

