//
//  ViewController.swift
//  RXStart
//
//  Created by Kim TaeSoo on 2022/10/24.
//

import UIKit

import RxCocoa
import RxSwift

class RxCocoaExampleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var sampleSwitch: UISwitch!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var nicknameLabel: UILabel!
    
    //DisposeBag : 리소스 해제 관리 -
        // 1. 시퀀스 끝날 때
        // 2. class deinit 자동해제 (bind)
        // 3. dispose() 직접 호출 -> dispose() 구독하는 것 마다 별도로 관리
        // 4. DisposeBag을 새롭게 할당하거나, nil전달
    var disposeBag = DisposeBag()
    var nickname = Observable.just("TaeSu")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addTarget(self, action: #selector(loginbuttonTapped), for: .touchUpInside)
        nickname
            .bind(to: nicknameLabel.rx.text)
            .disposed(by: disposeBag)
        
        
        setTableView()
        setPickerView()
        setSwitch()
        setSign()
        setOperator()
    }
    
    //viewcontroller deinit 되면 알아서 disposed된다
    deinit {
        print("RxCocoaExampleViewController deinit")
    }
    
    @objc func loginbuttonTapped() {
        present(SubjectViewController(), animated: true)
    }
    
    func setOperator() {
        
        // repeatElement : Next Event를 무수히 방출함. 무한 루프. take로 횟수제한
        Observable.repeatElement("taesu")
            .take(5) // 횟수 제한
            .subscribe { value in
                print("repeatElement - \(value)")
            } onError: { error in
                print("repeatElement - \(error)")
            } onCompleted: {
                print("repeatElement completed")
            } onDisposed: {
                print("repeatElement disposed")
            }
            .disposed(by: disposeBag)
        
        // 1초에 한번씩 무한한 시퀀스 반복
        let intervalObservable = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
            .subscribe { value in
                print("interval - \(value)")
            } onError: { error in
                print("interval - \(error)")
            } onCompleted: {
                print("interval completed")
            } onDisposed: {
                print("interval disposed")
            }
            .disposed(by: disposeBag)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            // 4
//            self.disposeBag = DisposeBag()
//        }
        
        let itemsA = [3.3, 4.0, 5.0, 2.0, 3.6, 4.8]
        let itemsB = [2.3, 2.0, 1.3]
        
        Observable.just(itemsA) // 인스턴스 1개만 들어올 수 있다.
            .subscribe { value in
                print("just - \(value)")
            } onError: { error in
                print("just - \(error)")
            } onCompleted: {
                print("just completed")
            } onDisposed: {
                print("just disposed") // 여기 실행됨
            }
            .disposed(by: disposeBag) // 여기 들어오면

        Observable.of(itemsA, itemsB) // 인스턴스 여러개 들어올 수 있다
            .subscribe { value in
                print("of - \(value)")
            } onError: { error in
                print("of - \(error)")
            } onCompleted: {
                print("of completed")
            } onDisposed: {
                print("of disposed")
            }
            .disposed(by: disposeBag)
        
        Observable.from(itemsA)
            .subscribe { value in
                print("from - \(value)")
            } onError: { error in
                print("from - \(error)")
            } onCompleted: {
                print("from completed")
            } onDisposed: {
                print("from disposed")
            }
            .disposed(by: disposeBag)
    }
    
    func setSign() {
        // tf1(옵저버블), tf2(옵저버블) > label (옵저버, bind)
        Observable.combineLatest(nameTextField.rx.text.orEmpty, passwordTextField.rx.text.orEmpty) { value1, value2  in
            
            "name은 \(value1)이고, password는 \(value2)입니다."
        }
        .bind(to: label.rx.text)
        .disposed(by: disposeBag)
        
        // 흐름 이해하기 .bind(옵저버에 깂전달)
        nameTextField // UItextField (시퀀스 1)
            .rx // Reactive (시퀀스 2)
            .text // String? (시퀀스 3)
            .orEmpty // String (시퀀스 4)
            .map { $0.count } // Int (시퀀스 5)
            .map { $0 < 3 } // (시퀀스 6)
            .bind(to: passwordTextField.rx.isHidden, loginButton.rx.isHidden)
            .disposed(by: disposeBag)
        
        passwordTextField
            .rx
            .text
            .orEmpty
            .map { $0.count > 4 }
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: disposeBag)

        loginButton.rx.tap
            .withUnretained(self) // [weak self]
            .subscribe { vc, _ in
                vc.showAlert()
            }
            .disposed(by: disposeBag)
    }
    func showAlert() {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취", style: .destructive)
        let ok = UIAlertAction(title: "굿", style: .cancel)
        alert.addAction(cancel)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }

    func setSwitch() {
        Observable.of(false) // just, of ?
            .bind(to: sampleSwitch.rx.isOn)
            .disposed(by: disposeBag)
    }
    
    func setTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let items = Observable.just([
            "First Item",
            "Second Item",
            "Third Item"
        ])

        items
        .bind(to: tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
            cell.textLabel?.text = "\(element) @ row \(row)"
            return cell
        }
        .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(String.self)
            .map { data in
                "\(data)를 클릭했습니다."
            }
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)

    }
    
    func setPickerView() {
        let items = Observable.just([
                "영화",
                "애니메이션",
                "드라마",
                "기타"
            ])
     
        items
            .bind(to: pickerView.rx.itemTitles) { (row, element) in
                return element
            }
            .disposed(by: disposeBag)
        
        pickerView.rx.modelSelected(String.self)
            .map { "\($0)" }
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
    }
    
}

