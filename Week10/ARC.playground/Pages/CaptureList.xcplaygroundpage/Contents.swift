//: [Previous](@previous)

import Foundation

class User {
    var nickname = "TEKIM"
    
    lazy var introduce = { [weak self] in
        return "저는 \(self!.nickname)입니다."
    }
    
    
    init() {
        print("User Init")
    }
    deinit {
        print("User Deinit")
    }
}
var user: User? = User()
user?.introduce


user = nil

print()
func myClosure() {
    var num = 0
    
    let closure: () -> () = { [num] in
        print("closure: \(num)")
    }

    print("1: \(num)")
    closure()

    num = 100
    
    print("2: \(num)")
    closure()
}

myClosure()

//: [Next](@next)
