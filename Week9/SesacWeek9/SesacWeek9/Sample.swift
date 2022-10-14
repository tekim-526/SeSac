//
//  Sample.swift
//  SesacWeek9
//
//  Created by Kim TaeSoo on 2022/09/01.
//

import Foundation

class User<T> {
    
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    init(_ value: T) {
        self.value = value
    }
    func bind(completionHandler: @escaping (T) -> Void) {
        completionHandler(value)
        listener = completionHandler
    }
}
