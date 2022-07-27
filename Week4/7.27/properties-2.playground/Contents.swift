import UIKit

// MARK: - Property Observer: 저장 프로퍼티에서 주로 사용되고, 저장 프로퍼티 값을 관찰을 하다가 변경이 될 것 같을 때 또는 변경이 되었을 때 호출됨 (willSet / didSet)

class TypeFoodRestaurant {
    static let name = "김치킨"
    static var totalOrderCount = 10{
        willSet {
            print("willSet : 총 주문건수 \(totalOrderCount)에서 \(newValue)로 변경될 예정입니다")
        }
        didSet {
            print("didSet : 총 주문건수 \(oldValue)에서 \(totalOrderCount)로 변경되었습니다.")
        }
    }
    static var nowOrder: Int {
        get {
            return totalOrderCount * 5000
        }
        set {
            totalOrderCount += newValue
        }
    }
}

// MARK: - 메서드 타입 메서트 & 인스턴스 메서드
// MARK: - self는 자기자신의 "인스턴스"를 의미함

struct Coffee {
    static var name = "아메리카노"
    static var shot = 2
    var price = 4900
    
    mutating func plusShot() {
        Coffee.shot += 1
        price += 300
    }
    class func minusShot() {
        shot -= 1
    }
}

//class Latte: Coffee {
//    override class func minusShot() {
//        shot -= 1
//    }
//}
