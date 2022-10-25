//
//  File.swift
//  RXStart
//
//  Created by Kim TaeSoo on 2022/10/25.
//

import Foundation
import RxSwift

struct Contact {
    var name: String
    var age: Int
    var number: Int
}


class SubjectViewModel {
    var contactData = [
        Contact(name: "taesu", age: 26, number: 01012341234),
        Contact(name: "tekim", age: 20, number: 01012341234),
        Contact(name: "taekim", age: 20, number: 01012341234)
    ]
    
    var list = PublishSubject<[Contact]>()
    
    func fetchData() {
        list.onNext(contactData)
    }
    
    func resetData() {
        list.onNext([])
    }
    func newData() {
        let new = Contact(name: "김", age: Int.random(in: 10...30), number: 101010)
        contactData.append(new)
        list.onNext(contactData) // 덮어쓰기
    }
    func filterData(query: String) {
        let new = contactData.filter {$0.name.contains(query)}
        list.onNext(new)
    }
}
