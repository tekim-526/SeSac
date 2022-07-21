import UIKit


// 1. 옵셔널 바인딩
var shopList: String? = "신발 사기"
var shopList2: String? = "모니터 사기"


if shopList != nil && shopList2 != nil {
    print(shopList!, shopList2!)
} else {
    print("글자를 입력해주세요")
}

// 2글자 이상을 꼭 입력해야 한다면?
if let value = shopList, let value2 = shopList2, (2...6).contains(value.count) {
    print(value, value2)
} else {
    print("글자를 입력해주세요")
}

func guardletCheck() {
    guard let tekim = shopList, let tekim2 = shopList2, (2...6).contains(tekim.count) else {
        print("글자를 입력해주세요")
        return
    }
    print(tekim, tekim2)
}
guardletCheck()

//2. 인스턴스 프로퍼티 vs 타입 프로퍼티
class User {
    var tekim = "tekim"
    static var staticTekim = "tekim"
}
class User2: User{

}
User.staticTekim // 호출시에 메모리에 올라감. 사용할때 초기화가 된다.

