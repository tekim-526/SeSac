import UIKit

// MARK: - enum

// 선언과 초기화
var email: String = "tekim@tekim.com"

// 선언이후 초기화
var email2: String?
email2 = "tekim@tekim.com"

type(of: email)
type(of: email2)

var array = Array(repeating: 0, count: 100)

var array2: [Int]? = [Int](0...99)
print(array2)

array2 = nil

let result = array2 == nil ? "값이 없습니다" : "값이 있습니다"

if array2 == nil {
    print("값이 없습니다")
} else {
    print("값이 있습니다")
}

func sample(num: Int) -> String{
    if num > 50 {
        return "UP"
    } else {
        return "DOWN"
    }
//    return num > 50 ? "UP" : "DOWN"
}

func bmiResult() -> (String, Double) {
    let ret = Double.random(in: 1...30)
    if ret < 18.5 {
        return ("정상", 1.0)
    } else if ret >= 18.5 && ret <= 23 {
        return ("비정상",2.0)
    } else {
        return ("매우 비정상", 4.0)
    }
//    return 3.0
}

let bmi = bmiResult()

@discardableResult
func randomNumber() -> Int {
    Int.random(in: 1...100)
}

let plusNumber = randomNumber() + 20

// 매개변수의 기본값 설정
func sayHello(nickname: String = "손", gender: Int? = 1) -> String {
    
    return nickname + "님, 반갑습니다!"
}
func sayHello(username: String) -> String {
    return "Hi " + username + "!"
}

let user = array2 == nil ? "손님" : "고래밥"

sayHello(nickname: user)
sayHello(nickname: "테스트")
sayHello(gender: 0)
sayHello()
sayHello(nickname: "김태수", gender: 200)
sayHello(username: "tekim")

print("hi", "에이치 아이", separator: " ", terminator: "\n")

// 열거형 (ex. 남/여/안함 -> 블랙/파란/흰)
enum Gender: String {
    case man = "남성"
    case woman = "여성"
    case nothing = "그 외의 성별"
}

var gender = Gender.nothing // "남자", "여자", "그외"

// if gender == 0 {}
// else if gender == 1 {}
// else if gender == 2 {}

switch gender {
case .man:
    print("\(gender.rawValue)입니다")
case .woman:
    print("\(gender.rawValue)입니다")
case .nothing:
    print("\(gender.rawValue)입니다")
}

enum HttpStatus: Int {
    case OK
    case NO_PAGE
    case NOT_FOUND
    case SERVER_ERROR
    
    func showStatus() -> String {
        switch self {
        case .OK: return "정상입니다"
        case .NO_PAGE: return "페이지를 찾을 수 없음"
        case .NOT_FOUND: return "잘못된 문제"
        case .SERVER_ERROR: return "페이지를 찾을 수 없음"
        }
    }
}

var networkStatus: HttpStatus = HttpStatus.OK

switch networkStatus {
case .OK: print("OK", networkStatus.rawValue)
case .NO_PAGE: print("잘못된 URL 주소", networkStatus.rawValue)
case .NOT_FOUND: print("페이지를 못 찾았습니다", networkStatus.rawValue)
case .SERVER_ERROR: print("서버 에러", networkStatus.rawValue)
}

let netResult = networkStatus.showStatus()

// MARK: - Class
// SuperClass, SubClass, BaseClass

// SuperClass, BaseClass(상속을 받지 않는다는 의미)
class Monster {
    var clothes = "Orange + Christmas"
    var speed = 5
    var power = 20
    var exPoint = 500.0
    
    func attack() {
        print("공격")
    }
}
// SubClass
class BossMonster: Monster {
    var limitLevel = 500
    
    func bossAttack() {
        print("스페셜 공격")
    }
    override func attack() {
        print("오버라이드 공격")
    }
}

var easyMonster = Monster() //초기화(인스턴스)
easyMonster.clothes
easyMonster.power
easyMonster.attack()

var finalBoss = BossMonster()
finalBoss.bossAttack()
finalBoss.limitLevel
finalBoss.power
finalBoss.attack()

var miniMonster = Monster()
var bossMonster = miniMonster

// 구조체는 값타입, 클래스는 참조타입
bossMonster.power = 5000
print(miniMonster.power) // 5000 miniMonster의메모리 주소를 bossMosnter가 공유하고 있기 때문에
print(bossMonster.power) // 5000

