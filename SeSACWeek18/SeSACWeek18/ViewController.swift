//
//  ViewController.swift
//  SeSACWeek18
//
//  Created by Kim TaeSoo on 2022/11/02.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let viewModel = ProfileViewModel()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let phone = Phone()
        print(phone[2])
        let login = SeSACAPI.login(email: "Tekim22@tekim.com", password: "12345678")
        Network.shared.requestSeSAC(type: Login.self, url: login.url, method: .post, parameters: login.parameters, headers: login.headers) { response in
            switch response {
            case .success(let value):
                UserDefaults.standard.set("\(value.token)", forKey: "token")
                print(UserDefaults.standard.string(forKey: "token")!)
                print("login : \(value)")
            case .failure(_):
                print("error")
            }
        }
        
        viewModel.profile
            .subscribe { value in
                print(value.user.email)
                print(value.user.username)
            } onError: { error in
                print(error.localizedDescription)
            } onCompleted: {
                print("Completed")
            } onDisposed: {
                print("Disposed")
            }.disposed(by: disposeBag)

        viewModel.getProfile()
        
        checkCOW()
    }
    
    // Copy On Write
    func checkCOW() {
        print("///////////////////////////////////////////////////////////////////////////////")
        var test = "tekim"
        
        address(&test)
        
        var test2 = test
        
        address(&test2)
        test2 = "asd"
        address(&test)
        address(&test2)
        
        var array = Array(repeating: "A", count: 100)
        address(&array)
        var newArray = array
        address(&newArray)
        
        newArray[0] = "B"
        address(&array)
        print(array[safe: 3])
        print(array[safe: 909])
        address(&newArray)
    }
    func address(_ value: UnsafeRawPointer) {
        let address = String(format: "%p", Int(bitPattern: value))
        print(address)
    }
}

