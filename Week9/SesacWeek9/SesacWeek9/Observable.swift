//
//  Observable.swift
//  SesacWeek9
//
//  Created by Kim TaeSoo on 2022/08/31.
//

import Foundation

class Observable<T> { // 양방향 데이터 바인딩
    private var listner: ((T) -> Void)?
    
    var value: T {
        didSet {
            print(value)
            listner?(value)
        }
    }
    init(_ value: T) {
        self.value = value
    }
    func bind(_ closure: @escaping (T) -> Void) {
        print(#function)
        closure(value)
        listner = closure
    }
    
}
