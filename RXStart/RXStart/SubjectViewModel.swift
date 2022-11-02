//
//  File.swift
//  RXStart
//
//  Created by Kim TaeSoo on 2022/10/25.
//

import Foundation

import RxCocoa
import RxSwift

protocol CommonViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

struct Contact {
    var name: String
    var age: Int
    var number: Int
}


class SubjectViewModel: CommonViewModel {
    var contactData = [
        Contact(name: "taesu", age: 26, number: 01012341234),
        Contact(name: "tekim", age: 20, number: 01012341234),
        Contact(name: "taekim", age: 20, number: 01012341234)
    ]
    
    var list = PublishRelay<[Contact]>()
    
    func fetchData() {
        list.accept(contactData)
    }
    
    func resetData() {
        list.accept([])
    }
    func newData() {
        let new = Contact(name: "김", age: Int.random(in: 10...30), number: 101010)
        contactData.append(new)
        list.accept(contactData) // 덮어쓰기
    }
    func filterData(query: String) {
        let new = contactData.filter {$0.name.contains(query)}
        list.accept(new)
    }
    
    struct Input {
        let addTap: ControlEvent<Void>
        let resetTap: ControlEvent<Void>
        let newTap: ControlEvent<Void>
        let searchText: ControlProperty<String?>
    }
    
    struct Output {
        let addTap: ControlEvent<Void>
        let resetTap: ControlEvent<Void>
        let newTap: ControlEvent<Void>
        let list: Driver<[Contact]>
        let searchText: Observable<String>
    }
    
    func transform(input: Input) -> Output {
        let list = list.asDriver(onErrorJustReturn: [])
        let text = input.searchText
            .orEmpty // VC -> VM (Input)
            .debounce(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
            .distinctUntilChanged()// 같은 값을 받지 않음
        
        
        return Output(addTap: input.addTap, resetTap: input.resetTap, newTap: input.newTap, list: list, searchText: text)
    }
    
    
    
}
