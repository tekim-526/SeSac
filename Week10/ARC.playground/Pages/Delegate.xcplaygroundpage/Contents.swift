//: [Previous](@previous)

import Foundation

protocol MyDelegate: AnyObject { // AnyObject
    func sendData(_ data: String)
}

class Main: MyDelegate {
    lazy var detail: Detail = {
       let view = Detail()
        view.delegate = self
        return view
    }()
    func sendData(_ data: String) {
        print("\(data)전달 받았음")
    }
    init() {
        print("Main init")
    }
    deinit {
        print("Main deinit")
    }
}

class Detail {
    weak var delegate: MyDelegate? // 타입으로서 프로토콜. 클래스의 인스턴스가 들어올 수 있음
    
    // dismiss실행될때 값 전달
    func dismiss() {
        delegate?.sendData("안녕")
    }
    init() {
        print("Detail init")
    }
    deinit {
        print("Detail deinit")
    }
}

var main: Main? = Main() // RC 1
main?.detail // RC 2
main = nil

//: [Next](@next)
