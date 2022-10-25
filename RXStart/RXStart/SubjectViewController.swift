//
//  SubjectViewController.swift
//  RXStart
//
//  Created by Kim TaeSoo on 2022/10/25.
//

import UIKit
import RxSwift
import RxCocoa

class SubjectViewController: UIViewController {

    
    @IBOutlet weak var newButton: UIBarButtonItem!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = SubjectViewModel()
    
    let behavior = BehaviorSubject(value: 100) // 초기값 필수
    let replay = ReplaySubject<Int>.create(bufferSize: 3) // bufferSize에 작성된 이벤트 갯수만큼 메모리에서 이벤트를 가지고 있음, subscribe 직후 한번에 이벤트를 전달
    let async = AsyncSubject<Int>()
    let disposebag = DisposeBag()
    let publish = PublishSubject<Int>() // 초기값이 없는 빈 상태
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactCell")
        viewModel.list
            .bind(to: tableView.rx.items(cellIdentifier: "ContactCell", cellType: UITableViewCell.self)) {(row, element, cell) in
                cell.textLabel?.text = "\(element.name): \(element.age)세 (\(element.number))"
            }.disposed(by: disposebag)
        addButton.rx.tap
            .withUnretained(self)
            .subscribe { vc, _ in
                vc.viewModel.fetchData()
            }.disposed(by: disposebag)
        resetButton.rx.tap
            .withUnretained(self)
            .subscribe { vc, _ in
                vc.viewModel.resetData()
            }.disposed(by: disposebag)
        newButton.rx.tap
            .withUnretained(self)
            .subscribe { vc, _ in
                vc.viewModel.newData()
            }.disposed(by: disposebag)
        searchBar.rx.text.orEmpty
            .distinctUntilChanged() // 같은 값을 받지 않음
            .withUnretained(self)
            .debounce(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance)
            .subscribe { vc, value in
                print("====\(value)")
                vc.viewModel.filterData(query: value)
            }.disposed(by: disposebag)
    }
    
    

}

extension SubjectViewController {
    
    
    
    func asyncSubject() {
        async.onNext(100)
        async.onNext(200)
        async.onNext(300)
        async.onNext(400)
        async.onNext(500)
        async
            .subscribe { value in
                print("async - \(value)")
            } onError: { error in
                print("async - \(error)")
            } onCompleted: {
                print("async - completed")
            } onDisposed: {
                print("async - disposed")
            }.disposed(by: disposebag)
        async.onNext(3)
        async.onNext(4)
        async.onCompleted()
    }
    func replaySubject() {
        replay.onNext(100)
        replay.onNext(200)
        replay.onNext(300)
        replay.onNext(400)
        replay.onNext(500)
        replay
            .subscribe { value in
                print("replay - \(value)")
            } onError: { error in
                print("replay - \(error)")
            } onCompleted: {
                print("replay - completed")
            } onDisposed: {
                print("replay - disposed")
            }.disposed(by: disposebag)
        replay.onNext(3)
        replay.onNext(4)
        replay.onCompleted()
    }
    
    func behaviorSubject() {
        // 구독전에 가장 최근값을 같이 emit
        behavior.onNext(1)
        behavior.onNext(2)
        behavior
            .subscribe { value in
                print("behavior - \(value)")
            } onError: { error in
                print("behavior - \(error)")
            } onCompleted: {
                print("behavior - completed")
            } onDisposed: {
                print("behavior - disposed")
            }.disposed(by: disposebag)
        behavior.onNext(3)
        behavior.onNext(4)
        behavior.onCompleted()
    }
    
    func publishSubject() {
        publish.onNext(1)
        publish.onNext(2)
        publish
            .subscribe { value in
                print("publish - \(value)")
            } onError: { error in
                print("publish - \(error)")
            } onCompleted: {
                print("publish - completed")
            } onDisposed: {
                print("publish - disposed")
            }.disposed(by: disposebag)
        publish.onNext(3)
        publish.onNext(4)
        publish.onCompleted()
    }
}
