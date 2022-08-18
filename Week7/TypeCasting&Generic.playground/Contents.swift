import UIKit

/*
 TypeCasting
  - 형변환 => 타입캐스팅/타입변환
  - 타입캐스팅: 인스턴스의 타입을 확인하거나 인스턴스 자신의 타입을 다른타입의 인스턴스인 것 처럼 사용할 때 활용하는 개념
 */



let a = 3
let value = String(a) // 이니셜라이저를 통해 새롭게 인스턴스를 생성한 것

type(of: a)
type(of: value)

class Mobile {
    let name: String
    var introduce: String {
        return "\(name)입니다"
    }
    
    init(name: String) {
        self.name = name
    }
}
class Google: Mobile {
    var materialDesign = "MaterialDesign"
}
class Apple: Mobile {
    var wwdc = "WWDC2022"
}

let mobile = Mobile(name: "phone")
let apple = Apple(name: "apple")
let google = Google(name: "google")

// is : 어떤 클래스의 인스턴스타입, 데이터 타입인지 확인
// ex. Local Notification

mobile is Mobile
mobile is Google
mobile is Apple

apple is Mobile
apple is Apple
apple is Google

// Type Cast Operator : as (업캐스팅) / as?, as! (다운캐스팅)

let iphone: Mobile = Apple(name: "Apple")

if let value = iphone as? Google {
    print(value.materialDesign)
} else {
    print("fail")
}
// iphone as! google => Runtime Error

// 업캐스팅
apple as Mobile

// Any(모든 타입에 대한 인스턴스를 담을 수 있음 (ex. String, Int, Class etc..) vc AnyObject (클래스의 인스턴스만 담을 수 있음)
// 컴파일 시점에선 어떤 타입인지 알 수 없고, 런타임 시점에 타입이 결정

var somethings: [Any] = []

somethings.append(0)
somethings.append("any")
somethings.append(0.3)
somethings.append(mobile)
somethings.append(true)
print(somethings[1])

let example = somethings[1]
if let element = example as? String {
    print(element.count)
}

let name: String? = "abc"
if let name = name {
    print(name)
}

// MARK: - Generic
/*
 - 타입에 유연하게 대응
 - Type Parameter: 플레이스 홀더 같은 역할. 어떤 타입인지 종류는 알려주지 않음. 특정한 타입 하나 라는건 알려줌. UpperCased
 - Type Constraints: 클래스/프로토콜 제약
 */

// ex1
func configureBorderLabel(_ view: UILabel) {
    view.backgroundColor = .systemMint
    view.clipsToBounds = true
    view.layer.cornerRadius = 8
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.borderWidth = 1
}

func configureBorderButton(_ view: UIButton) {
    view.backgroundColor = .systemMint
    view.clipsToBounds = true
    view.layer.cornerRadius = 8
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.borderWidth = 1
}

func configureBorderTextField(_ view: UITextField) {
    view.backgroundColor = .systemMint
    view.clipsToBounds = true
    view.layer.cornerRadius = 8
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.borderWidth = 1
}

func configureBorder<T: UIView>(_ view: T)  {
    view.backgroundColor = .systemMint
    view.clipsToBounds = true
    view.layer.cornerRadius = 8
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.borderWidth = 1
}

let image = UIImageView()
let label = UILabel()
configureBorder(image)
configureBorder(label)

// ex2
struct DummyData<T: Equatable> {
    var name: T
    var tf: T
}
let data2 = DummyData(name: true, tf: true)
let data = DummyData(name: "String", tf: "sd")

// ex3
func total<T: Numeric>(a: [T]) -> T {
    return a.reduce(.zero, +)
}
total(a: [0.1 ,1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1])
total(a: [1,2,3,4,5,6,7,8,9,10])


// ex4 -> 화면 전환 코드
class sampleViewController: UIViewController {
    func transitionViewController<T: UIViewController>(sb: String, id: String, vc: T) {
        let sb = UIStoryboard(name: sb, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: id) as! T
        self.present(vc, animated: true)
    }
}

class Animal: Equatable {
    static func == (lhs: Animal, rhs: Animal) -> Bool {
        return lhs.name == rhs.name
    }
    
    var name: String
    init(name: String) {
        self.name = name
    }
}

let one = Animal(name: "cat")
let two = Animal(name: "cat")

one == two

// input parameter
var fruit1 = "apple"
var fruit2 = "banana"

swap(&fruit1, &fruit2)

fruit1
fruit2

func swapTwoValues<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

var int1 = 1
var int2 = 2

swapTwoValues(a: &int1, b: &int2)
swapTwoValues(a: &fruit1, b: &fruit2)

fruit1
fruit2

int1
int2
