//
//  SubscriptExample.swift
//  SeSACWeek18
//
//  Created by Kim TaeSoo on 2022/11/03.
//

import Foundation

extension String {
    
    subscript(idx: Int) -> String? {
        guard (0..<count).contains(idx) else { return nil }
        let result = index(startIndex, offsetBy: idx)
        return String(self[result])
    }
    
}

extension Collection {
    
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

struct Phone {
    var numbers = ["123", "456", "789", "0123"]
    subscript(idx: Int) -> String {
        get {
            return self.numbers[idx]
        }
        set {
            self.numbers[idx] = newValue
        }
    }
}
