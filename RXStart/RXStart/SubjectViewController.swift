//
//  SubjectViewController.swift
//  RXStart
//
//  Created by Kim TaeSoo on 2022/10/25.
//

import UIKit

import RxAlamofire
import RxSwift
import RxCocoa
import RxDataSources

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
    
    lazy var dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Int>> { dataSource, tableView, indexPath, item in
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = "\(item)"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testRxAlamofire()
        behaviorSubject()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ContactCell")
        
        let input = SubjectViewModel.Input(addTap: addButton.rx.tap, resetTap: resetButton.rx.tap, newTap: newButton.rx.tap, searchText: searchBar.rx.text)
        
        let output = viewModel.transform(input: input)
        
        output.list
            .drive(tableView.rx.items(cellIdentifier: "ContactCell", cellType: UITableViewCell.self)) {(row, element, cell) in
                cell.textLabel?.text = "\(element.name): \(element.age)세 (\(element.number))"
            }.disposed(by: disposebag)
        
        output.addTap
            .withUnretained(self)
            .subscribe { vc, _ in
                vc.viewModel.fetchData()
            }.disposed(by: disposebag)
        output.resetTap
            .withUnretained(self)
            .subscribe { vc, _ in
                vc.viewModel.resetData()
            }.disposed(by: disposebag)
        
        output.newTap // VC -> VM (Input)
            .withUnretained(self)
            .subscribe { vc, _ in
                vc.viewModel.newData()
            }.disposed(by: disposebag)
        
        output.searchText
            .withUnretained(self)
            
            .subscribe { vc, value in
                print("====\(value)")
                vc.viewModel.filterData(query: value)
            }.disposed(by: disposebag)
        //testRxDataSource()
    }
    
    

}
enum APIKey {
    static let baseURL = "https://api.unsplash.com"
    static let searchURL = "https://api.unsplash.com/search/photos?query="
    static let authorization = "Client-ID 3RpxxEkjeZ3qen3644pICDm5bVCbz9LRCN-KJcdNZtI"
}
extension SubjectViewController {
    
    func testRxAlamofire() {
        // Success Error => <Single>
        let url = APIKey.searchURL + "apple"
        request(.get, url, headers: ["Authorization" : APIKey.authorization])
            .data()
            .decode(type: SearchPhoto.self, decoder: JSONDecoder())
            .subscribe { value in
                print(#function)
                print(value.results[0].likes)
            }.disposed(by: disposebag)
    }
    func testRxDataSource() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        dataSource.titleForHeaderInSection = { dataSource, index in
            return dataSource.sectionModels[index].model
        }
        
        Observable.just([
            SectionModel(model: "title", items: [1, 2, 3]),
            SectionModel(model: "title", items: [1, 2, 3]),
            SectionModel(model: "title", items: [1, 2, 3])
        ])
        .bind(to: tableView.rx.items(dataSource: dataSource))
        .disposed(by: disposebag)
        
    }
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
        behavior.onNext(200)
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
